var order = {
		
	submit : function(pid) {
		
	    if(confirm("确定要提交订单吗？")) {
	    
	        var model = {
                serial : $("#serial").html(),
                "product.id" : pid,
                amount : $("#amount").val().trim(),
                address : $("#address").val().trim(),
                note : $("#note").val()
	        };
	        
	        if(order.check(model)) {
	            order.realSubmit(model);
	        }
	    }
	},
	
	// 校验参数
	check : function(model) {
	    if(!/^[0-9]+$/.test(model.amount)) {
	        alert("产品数量必须为数字", 3);
	        return false;
	    }
	    
	    if(model.address === "") {
	        alert("送货地址不能为空", 3);
            return false;
	    }
	    
	    return true;
	},
	
	// 执行提交
	realSubmit : function(model) {
	    myUtil.showLoading();
        $.post("phone/order/add", model, function(result) {
            myUtil.hideLoading();
            if(result.status == 1) {
                
                order.back();
                alert("提交成功");
            }
        }, "json");
	},
	
	// 返回详情
	back : function() {
	    
	    // 隐藏产品详情
        $("#detailBlock").show();
        $("#detailBlock").parent().css("height", "auto");
        $("#orderDiv").css("-webkit-transform", "translate3d(500px, 0px, 0px)");
        $("#orderDiv").css("-moz-transform", "translate3d(500px, 0px, 0px)");
	},
	
	// 更新卖出数量
	updateOutAmount : function(id) {
	    var outAmount = $("#outAmount").val().trim();
	    $.post("phone/order/update/" + id, {outAmount : outAmount}, function(result) {
	        if(result.status == 1) {
	            alert("修改卖出数量成功");
	        }
	        else {
	            alert("修改卖出数量失败");
	        }
	    }, "json");
	}
};
