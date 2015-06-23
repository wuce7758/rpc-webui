<!DOCTYPE html>
<html>
<head>
   <title>rpc admin</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <script src="/jquery/jquery-2.1.3.min.js"></script>
   <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css"/>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<#assign page='index'/>
		<#include 'navbar.ftl'/>
		<div class="panel panel-primary">
		  	<div class="panel-body">
				<form id="selectByKeyWords" action="/webui/services" method="GET" class="form-inline">
				 	<!--放在同一行-->
					<div class="btn-group">
						<button type="button" class="btn btn-primary">namespace</button>
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							${namespace}<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<#list namespaces as np>
								<#if np!=namespace>
								<li><a href="/webui/services?keyword=<#if keyword??>${keyword}</#if>&namespace=${np}">${np}</a></li>
								</#if>
							</#list>
						</ul>
					</div>

					<div class="input-group">
						<input id="keywords" name="keyword" type="text" class="form-control searchIpt" aria-describedby="basic-addon1"
							   placeholder="please input keyword"  <#if keyword??>value="${keyword}"</#if>>
					</div>
					<input type="hidden" name="namespace" value="${namespace}">
					<div class="btn-group">
						<button type="submit"  class="btn btn-primary" >search</button>
					</div>
				 </form>
				<br/>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>service</th>
							<th>version</th>
							<th>impl</th>
							<th>hosts</th>
						</tr>
					</thead>
					<tbody>
						<#if (services??)>
						<#list services as service>
						<tr>
							<td>${service.name}</td>
							<td>${service.version}</td>
							<td>${service.impl}</td>
							<td><a href="/webui/service/hosts?namespace=${namespace}&serviceName=${service.name}&serviceVersion=${service.version}">hosts</a></td>
						</tr>
						</#list>
						</#if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>