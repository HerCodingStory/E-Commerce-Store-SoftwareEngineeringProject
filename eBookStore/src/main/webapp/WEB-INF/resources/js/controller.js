var cartApp = angular.module("cartApp", []);

cartApp.controller("cartCtrl", function ($scope, $http){

    $scope.refreshCart = function () {
        $http.get('/eBookStore/rest/cart/'+$scope.cartId).success(function (data) {
            $scope.cart=data;
        });
    };

    $scope.refreshSavedItems = function () {
        $http.get('/eBookStore/rest/savedItems/'+$scope.savedItemsId).success(function (data) {
            $scope.savedItems=data;
        });
    };

    $scope.clearCart = function () {
        $http.delete('/eBookStore/rest/cart/'+$scope.cartId).success($scope.refreshCart());
    };
/*
    $scope.initCartId = function (cartId, savedItemsId) {


        console.log("saaaa");
        $scope.cartId = cartId;
        $scope.savedItemsId = savedItemsId;
        $scope.refreshCart(cartId);
        $scope.refreshSavedItems(savedItemsId)

    };*/

    $scope.addToCart = function (productId) {
        $http.put('/eBookStore/rest/cart/add/'+productId).success(function () {
            alert("Product successfully added to the cart!")
        });
    };

    $scope.saveItems = function (productId) {
        console.log("HEy");
        $http.put('/eBookStore/rest/savedItems/save/'+productId).success(function () {
            alert("Product successfully added to the cart!")
        });
    };

    $scope.addToQuantity = function (productId) {
        console.log("HEyyyy");
        $http.put('/eBookStore/rest/cart/plus/'+productId).success(function (data) {
            $scope.refreshCart();
        });
    };

    $scope.subtractFromQuantity = function (productId) {
        console.log("HEyyyy");
        $http.put('/eBookStore/rest/cart/minus/'+productId).success(function (data) {
            $scope.refreshCart();
        });
    };

    $scope.removeFromCart = function (productId) {
        $http.put('/eBookStore/rest/cart/remove/'+productId).success(function (data) {
            $scope.refreshCart();
        });
    };

    $scope.removeFromSave = function (productId) {
        console.log("HEyyyy");
        $http.put('/eBookStore/rest/savedItems/removeSaved/'+productId).success(function (data) {
            $scope.refreshCart();
        });
    };

    $scope.calGrandTotal = function () {
        var grandTotal=0;

        for (var i=0; i<$scope.cart.cartItems.length; i++) {
            grandTotal+=$scope.cart.cartItems[i].totalPrice;
        }

        return grandTotal;
    };
});