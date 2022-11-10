const app = angular.module("shopping-cart-app",[]);

app.controller("shopping-cart-ctrl",function($scope, $http){
	$scope.items = [];
	
	$scope.initialize = function(){
		// load product
		$http.get("/rest/products").then(resp => {
			$scope.items = resp.data;
			$scope.items.forEach(item => {
				item.createDate = new Date(item.createDate)
			})
		});
		//load categories
		$http.get("/rest/categories").then(resp => {
			$scope.cates = resp.data;
		});
	}

	$scope.initialize();
	$scope.cart = {
		items: [],
		add(id){
			var item = this.items.find(item => item.id == id);
			if(item){
				item.qty++;
				this.saveToLocalStorage();
				
			}
			else{
				$http.get(`/rest/products/${id}`).then(resp => {
					resp.data.qty = 1;
					this.items.push(resp.data);
					this.saveToLocalStorage();
			 	
				})
			}
			confirm("Sản phẩm đã được thêm vào giỏ hàng !");
			
		},
		saveToLocalStorage(){
			var json = JSON.stringify(angular.copy(this.items));
			localStorage.setItem("cart",json);
		},
		get count(){
			return this.items
			.map(item => item.qty)
			.reduce((total, qty) => total += qty, 0);
		},
		get amount(){
			return this.items
			.map(item => item.qty * item.price)
			.reduce((total, qty) => total += qty, 0);
		},
	
		loadFormLocalStorage(){
			var json = localStorage.getItem("cart");
			this.items = json ? JSON.parse(json):[];
		},
		remove(id){
			var index = this.items.findIndex(item => item.id == id);
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},
		clear(){
			this.items=[]
			this.saveToLocalStorage();
		}
	}
	$scope.cart.loadFormLocalStorage();
	$scope.order = {
		createDate: new Date(),
		address:"",
		account:{username:$("#username").text()},
		get orderDetails(){
			return $scope.cart.items.map(item => {
				return{
					product:{id: item.id},
					price: item.price,
					quantity: item.qty
				}
			});
		},
		purchase(){
			var order = angular.copy(this);
			$http.post("/rest/orders",order).then(resp => {
				alert("Đặt hàng thành công");
				$scope.cart.clear();
				location.href="/order/detail/" + resp.data.id;
			}).catch(error => {
				alert("Đặt hàng lỗi!")
				console.log(error)
				
			})
		}
	}
	$scope.pager = {
		page: 0,
		size: 10,
		get items(){
			var start = this.page * this.size;
			return $scope.items.slice(start, start + this.size);
		},
		get count(){
			return Math.ceil(1.0 * $scope.items.length / this.size);
		},
		first(){
			this.page = 0;
		},
		prev(){
			this.page--;
			if(this.page < 0){
				this.last();
			}
		},
		next(){
			this.page++;
			if(this.page >= this.count){
				this.first();
			}
		},
		last(){
			this.page = this.count - 1;
		}
	}

	function carttotal(){
		var cartItem = document.querySelectorAll("tbody tr")
		var totalC = 0
		for (var i=0;i<cartItem.length;i++){
			var inputValue = cartItem[i].querySelector("input").value
			var productPrice = cartItem[i].querySelector("span").innerHTML
			totalA = inputValue*productPrice*1000
			totalC = totalC + totalA
			totalD = totalC.toLocaleString('de-DE')
		}
		var cartTotalA = document.querySelector(".price-total span")
		cartTotalA.innerHTML = totalD
		console.log(cartTotalA)
	}
})
	
