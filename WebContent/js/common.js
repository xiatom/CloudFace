function addInfo(modalName,obj) {
	var $ = jQuery;
	if(obj=="-1"){
		alert("当前项目为全部项目,请切换到具体项目后再执行添加操作！");
		return false;
	}
		
	$(modalName).modal('show');
}
function addInfo2(modalName) {
	var $ = jQuery;
	$(modalName).modal('show');
}

function check_all(obj, cName) {
	var checkboxs = document.getElementsByName(cName);
	for (var i = 0; i < checkboxs.length; i += 1) {
		checkboxs[i].checked = obj.checked;
	}
}


