<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath%>/resources/css/bootstrap.min.css">
<style type="text/css">
td{
width: 100px;
border: 1px solid red;
}
</style>
</head>
<body>
	
		
	<ul class="nav nav-tabs">
		<li role="presentation" class="active">
			<a data-toggle="tab" href="#tab-baseinfo" >基本信息</a>
		</li>
		<li role="presentation">
			<a data-toggle="tab" href="#tab-probability">概率与奖励</a>
		</li>
		<li role="presentation">
			<a data-toggle="tab" href="#tab-records">抽奖记录</a>
		</li>
		<li role="presentation">
			<a data-toggle="tab" href="#tab-users">用户</a>
		</li>
	</ul>
	
	<div class="tab-content">
		<div id="tab-baseinfo" class="tab-pane fade active in">
			<div class="row" style="margin-top: 15px;">
				<div class="col-sm-12">
					<span class="bean-name">APP ID:</span> ${platform.appId}
				</div>
			</div>
			<div class="row" style="margin-top: 15px;">
				<div class="col-sm-12">
					<span class="bean-name">APP SECRET:</span> ******************************
				</div>
			</div>
			<div class="row" style="margin-top: 15px;">
				<div class="col-sm-12">
					<span class="bean-name">应用名称:</span> ${platform.name}
				</div>
			</div>
			<div class="row" style="margin-top: 15px;">
				<div class="col-sm-12">
					<span class="bean-name">通知地址:</span> ${platform.notifyUrl}
				</div>
			</div>
			<div class="row" style="margin-top: 15px;">
				<div class="col-sm-12">
					<span class="bean-name">规则图片:</span>
					<img src="${platform.rulePicUrl}" width="300px;"> 
				</div>
			</div>
		</div>
		
		<div id="tab-probability" class="tab-pane fade">
			<table class="table table-bordered table-hover" style="margin-top: 15px;">
				<thead>
					<tr>
						<th>序号</th>
						<th>概率</th>
						<th>奖励（分）</th>
						<th width="200px">操作</th>
					</tr>
				</thead>
				<tbody id="probability-list">
					<c:forEach items="${probabilities}" var="p" varStatus="status">
						<tr id="probability-${p.id}">
							<td>${status.index + 1}</td>
							<td>${p.probability}</td>
							<td>${p.bonus}</td>
							<td>
								<button class="btn btn-primary" onclick="editProbability(${p.id}, ${p.probability}, ${p.bonus})">编辑</button>
								<button class="btn btn-danger" onclick="deleteProbability(${p.id})">删除</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<button class="btn btn-primary" onclick="newProbability()">新增概率</button>
		</div>
		
		<div id="tab-records" class="tab-pane fade">
                <!-- 表格 -->
			<table id="recordTable" class="table table-striped table-bordered table-hover" style="margin-top: 15px;">
				<thead>
					<tr>
						<th>序号</th>
						<th>账号</th>
						<th>抽奖记录</th>
						<th>抽奖时间</th>
					</tr>
				</thead>
				<tbody id="recordTableList"></tbody>
			</table>
			
			<div class="text-center">
		        <nav>
		            <ul class="pagination" id ="paginationId">
		               <li id="firstPageId"><span onclick="firstPage();">首页</span></li>
		               <li id="lastPageId"><span onclick="lastPage();">&laquo;上一页</span></li>
		               <li id="nextPageId"><span onclick="nextPage();">下一页&raquo;</span> </li>
		               <li id="endPageId"><span onclick="endPage();">尾页</span></li>
		            </ul>
		        </nav>
		    </div>
		</div>
		
		<!-- yonghu -->
		<div id="tab-users" class="tab-pane fade">
			<table class="table table-bordered table-hover" style="margin-top: 15px;">
				<thead>
					<tr>
						<th>序号</th>
						<th>姓名</th>
						<th>账号</th>
						<th>头像</th>
						<th>创建时间</th>
					</tr>
				</thead>
				<tbody id="probability-list">
				<c:forEach var="user" items="${result}">
					<tr>
						<td>${user.id}</td>
						<td>${user.name}</td>
						<td>${user.phone}</td>
						<td><img alt="此图确实" src="<%=basePath%>/resources/img/bg.jpg" width="100px;"height="50px;"></td>
						<td><fmt:formatDate value="${user.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
   		 		</c:forEach>
				</tbody>
			</table>
			
			<div class="text-center">
		        <nav>
		            <ul class="pagination" id ="paginationId">
		               <li id="firstPageId"><span onclick="firstPage();">首页</span></li>
		               <li id="lastPageId"><span onclick="lastPage();">&laquo;上一页</span></li>
		               <li id="nextPageId"><span onclick="nextPage();">下一页&raquo;</span> </li>
		               <li id="endPageId"><span onclick="endPage();">尾页</span></li>
		            </ul>
		        </nav>
		    </div>
			
		</div>
		
	</div>
	
	
	
	<div class="modal fade" id="p-modal" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">概率与奖励</h4>
				</div>
				<div class="modal-body bean">
					
					<div id="p-modal-errmsg" style="padding-bottom: 10px;" class="hide">
						<div class="bg-danger" style="padding: 5px;">
							<span></span>
						</div>
					</div>
				
					<div class="form-group">
						<label for="probability">概率</label>
						<input id="probability" type="number" class="form-control" placeholder="输入概率" />
					</div>
					
					<div class="form-group">
						<label for="bonus">奖励（分）</label>
						<input id="bonus" type="number" class="form-control" placeholder="输入奖励（整数）" />
					</div>
					
					<button class="btn btn-primary" onclick="saveProbability()">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
<script type="text/javascript" src="<%=basePath%>/resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
var ticket = '${ticket}';
var timestr = '${timestr}';
var platformId = '${platform.id}';
var nextIndex = '${probabilities.size() + 1}';

var probabilityId = null;

function newProbability() {
	probabilityId = null;
	clearErrmsg('#p-modal-errmsg');
	$('#probability').val('');
	$('#bonus').val('');
	$('#p-modal').modal('show');
}

function editProbability(id, probability, bonus) {
	probabilityId = id;
	clearErrmsg('#p-modal-errmsg');
	$('#probability').val(probability);
	$('#bonus').val(bonus);
	$('#p-modal').modal('show');
}

function saveProbability() {
	clearErrmsg('#p-modal-errmsg');
	var probability = $('#probability').val();
	var bonus = $('#bonus').val();
	if (!isNumber(probability) || probability < 0) {
		showErrmsg('#p-modal-errmsg', '请输入正确的概率（数字）');
		return;
	}
	if (!isNumber(bonus) || bonus < 0) {
		showErrmsg('#p-modal-errmsg', '请输入正确的奖励（数字）');
		return;
	}
	$.post('${ctx}/api/saveProbability', {
		platformId: platformId,
		probabilityId: probabilityId,
		probability: probability,
		bonus: bonus,
		ticket: ticket,
		timestr: timestr
	}, function(resp) {
		if (resp.errcode == 0) {
			ticket = resp.data.ticket;
			timestr = resp.data.timestr;
			var p = resp.data.probability;
			if (probabilityId) {
				$('#probability-' + probabilityId + ' td:eq(1)').text(p.probability);
				$('#probability-' + probabilityId + ' td:eq(2)').text(p.bonus);
			} else {
				var tr = $('<tr id="probability-' + p.id + '"></tr>');
				tr.append('<td>' + nextIndex + '</td>');
				tr.append('<td>' + p.probability + '</td>');
				tr.append('<td>' + p.bonus + '</td>');
				tr.append('<td><button class="btn btn-primary" onclick="editProbability(' + p.id + ',' + p.probability + ',' + p.bonus 
						+ ')">编辑</button><button class="btn btn-danger" onclick="deleteProbability(' + p.id + ')">删除</button></td>');
				$('#probability-list').append(tr);
				nextIndex++;
			}
			$('#p-modal').modal('hide');
		} else {
			showErrmsg('#p-modal-errmsg', resp.errmsg);
		}
	});
}

function deleteProbability(id) {
	if (confirm('确认要删除吗？')) {
		$.post('${ctx}/api/deleteProbability', {
			platformId: platformId,
			probabilityId: id,
			ticket: ticket,
			timestr: timestr
		}, function(resp) {
			if (resp.errcode == 0) {
				ticket = resp.data.ticket;
				timestr = resp.data.timestr;
				$('#probability-' + id).remove();
			} else {
				alert(resp.errmsg);
			}
		});
	}
}

function clearErrmsg(el) {
	var e = $(el);
	if (!e.hasClass('hide')) {
		e.addClass('hide');
	}
}

function showErrmsg(el, errmsg) {
	$(el + ' span').text(errmsg);
	$(el).removeClass('hide');
}

function isNumber(value) {
	if (typeof value == 'number') {
		return true;
	}
	if (typeof value == 'string') {
		value = value.replace(/^\s+|\s+$/gm, '');
		if (value == '') {
			return false;
		}
		return !isNaN(value);
	}
	return false;
}

//抽奖记录
var totalPages = 0;
var size = 15;
var currendPage = 0;

$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	getRecordList(currendPage,size);
});

function getRecordList(page,size) {
	$.get('${ctx}/manage/recordList', {
		pageNo: page,
		size: size
	}, function(resp) {
		totalPages =resp.totalPages;
		size =resp.size;
	    currendPage =resp.pageNo;
		var recordTableList = $('#recordTableList');
		recordTableList.empty();
		for(var i = 0; i < resp.dataList.length; i++) {
			var tr = $('<tr></tr>');
			tr.append('<td>' + (i+1+currendPage * size) + '</td>');
			tr.append('<td>' + resp.dataList[i].userId + '</td>');
			tr.append('<td>' + resp.dataList[i].title + '</td>');
			tr.append('<td>' + resp.dataList[i].time + '</td>');
			recordTableList.append(tr);
		} 
		if((currendPage) <= 0) {
			$('#firstPageId').addClass("disabled");
			$('#lastPageId').addClass("disabled");
		} else {
			$('#firstPageId').removeClass(); 
			$('#lastPageId').removeClass();
		}
		
		if((currendPage + 1) >= totalPages) {
			$('#endPageId').addClass("disabled");
			$('#nextPageId').addClass("disabled");
		} else {
			$('#endPageId').removeClass(); 
			$('#nextPageId').removeClass();
		}
	});
}


function firstPage() {
	getRecordList(0, size);
}

function endPage() {
	getRecordList(totalPages-1, size);
}

function lastPage() {
	if((currendPage - 1) <= 0) {
		getRecordList(0, size);
	} else {
		getRecordList(currendPage - 1, size);
	}
}

function nextPage() {
	if((currendPage+1) >= totalPages) {
		getRecordList(currendPage, size);
	} else {
		getRecordList(currendPage+1, size);
	}
}
	
</script>
</html>