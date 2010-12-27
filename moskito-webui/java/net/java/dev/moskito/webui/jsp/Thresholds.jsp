<%@ page language="java" contentType="text/html;charset=UTF-8" session="true"
%><%@ taglib uri="http://www.anotheria.net/ano-tags" prefix="msk"
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Moskito Thresholds</title>
	<link rel="stylesheet" href="mskCSS"/>
</head>
<body>
<script type="text/javascript" src="../js/wz_tooltip.js"></script>
<script type="text/javascript" src="../js/jquery-1.4.min.js"></script>
<script type="text/javascript" src="../js/function.js"></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>

<jsp:include page="Menu.jsp" flush="false"/>

<div class="main">
	<div class="clear"><!-- --></div>
	<%--<div class="additional">--%>
	<%--<div class="top"><div><!-- --></div></div>--%>
	<%--<div class="add_in">--%>
	<%--<div><span>System state</span></div>--%>
	<%--</div>--%>
	<%--<div class="bot"><div><!-- --></div></div>--%>
	<%--</div>--%>

	<!-- definition for overlays -->
		<script type="text/javascript">
		<msk:iterate name="infos" type="net.java.dev.moskito.webui.bean.ThresholdInfoBean" id="info">
			var info<msk:write name="info" property="id"/> = {
				"name": "<msk:write name="info" property="name"/>",
				"producerName": "<msk:write name="info" property="producerName"/>",
				"statName": "<msk:write name="info" property="statName"/>",
				"valueName": "<msk:write name="info" property="valueName"/>",
				"intervalName": "<msk:write name="info" property="intervalName"/>",
				"descriptionString": "<msk:write name="info" property="descriptionString"/>",
				"guards": [<msk:iterate name="info" property="guards" id="guard" type="java.lang.String">"<msk:write name="guard"/>",</msk:iterate>]
			};
		</msk:iterate>
		</script>
		<script type="text/javascript">
			function openOverlay(selectedInfo){
				$('.lightbox').show();
				var el = $('.lightbox');
				el.find('#name').text(selectedInfo.name);
				el.find('#producerName').text(selectedInfo.producerName);
				el.find('#statName').text(selectedInfo.statName);
				el.find('#valueName').text(selectedInfo.valueName);
				el.find('#intervalName').text(selectedInfo.intervalName);
				el.find('#descString').text(selectedInfo.descriptionString);
				el.find('table tbody').html('');
				for (i=0; i<selectedInfo.guards.length; i++)
				{
					if (i % 2) {
						el.find('table tbody').append('<tr class="even"><td>'+selectedInfo.guards[i]+'</td></tr>')
					} else {
						el.find('table tbody').append('<tr class="odd"><td>'+selectedInfo.guards[i]+'</td></tr>')
					}
				}
				$('.lightbox .box').css('width', 'auto');
				$('.lightbox .box').width($('.lightbox .box_in').width());				

				var wid = el.find('.box').width();
				var box = el.find('.box');
				var hig = el.find('.box').height();
				
				box.css('left', '50%');
				box.css('margin-left', -wid / 2);
				box.css('top', '50%');
				box.css('margin-top', -hig / 2);
				box.css('position', 'fixed');
				return false;

//				alert("open overlay for "+selectedInfo.name);
			}
		</script>
	<!-- end of definition for overlays -->

	<div class="clear"><!-- --></div>
	<div class="table_layout">
		<div class="top">
			<div><!-- --></div>
		</div>
		<div class="in">
			<h2><span>System state</span></h2>

			<div class="clear"><!-- --></div>
			<div class="table_itseft">
				<div class="top">
					<div class="left"><!-- --></div>
					<div class="right"><!-- --></div>
				</div>
				<div class="in">
					<table cellpadding="0" cellspacing="0" width="100%">
						<thead>
						<tr>
							<th>Name</th>
							<th>Status</th>
							<th>Value</th>
							<th>Status Change</th>
							<th>Change Timestamp</th>
							<th>Path</th>
						</tr>
						</thead>
						<tbody>
						<%--
						<msk:iterate name="recorded" type="net.java.dev.moskito.webui.bean.RecordedUseCaseListItemBean" id="useCase" indexId="index">
							<tr class="<%= ((index & 1) == 0 )? "even" : "odd" %>">
								<td><msk:write name="index"/></td>
								 <td>
									<a href="mskShowMonitoringSessionCall?pSessionName=<msk:write name="msession" property="name"/>&pPos=<msk:write name="index"/>">
										<msk:write name="useCase" property="name"/>
									</a>
								 </td>	
								 <td>	
									<msk:write name="useCase" property="date"/>
								  </td>
							</tr>
						</msk:iterate>--%>
						<msk:iterate name="thresholds" type="net.java.dev.moskito.webui.bean.ThresholdBean" id="threshold" indexId="index">
							<tr class="<%= ((index & 1) == 0 )? "even" : "odd" %>">
								<td><a href="#" onclick="openOverlay(info<msk:write name="threshold" property="id"/>); return false"><msk:write name="threshold" property="name"/></a></td>
								<td><img src="../img/ind_<msk:write name="threshold" property="colorCode"/>.<msk:equal name="threshold" property="colorCode" value="purple">gif</msk:equal><msk:notEqual name="threshold" property="colorCode" value="purple">png</msk:notEqual>" alt="<msk:write name="threshold" property="status"/>"/></td>
								<td><msk:write name="threshold" property="value"/></td>
								<td><msk:write name="threshold" property="change"/></td>
								<td><msk:write name="threshold" property="timestamp"/></td>
								<td><msk:write name="threshold" property="description"/></td>
							</tr>							
						</msk:iterate>
						</tbody>
					</table>
					<div class="clear"><!-- --></div>
				</div>
				<div class="bot">
					<div class="left"><!-- --></div>
					<div class="right"><!-- --></div>
				</div>
			</div>
		</div>
		<div class="bot">
			<div class="left"><!-- --></div>
			<div class="right"><!-- --></div>
		</div>
	</div>
	<%--<br><br><br>--%>
	<div class="clear"><!-- --></div>
	<%--<div class="additional">--%>
	<%--<div class="top"><div><!-- --></div></div>--%>
	<%--<div class="add_in">--%>
	<%--<div><span>History</span></div>--%>
	<%--</div>--%>
	<%--<div class="bot"><div><!-- --></div></div>--%>
	<%--</div>--%>

	<div class="clear"><!-- --></div>
	<div class="table_layout">
		<div class="top">
			<div><!-- --></div>
		</div>
		<div class="in">
			<h2><span>History (newest first)</span></h2>

			<div class="clear"><!-- --></div>
			<div class="table_itseft">
				<div class="top">
					<div class="left"><!-- --></div>
					<div class="right"><!-- --></div>
				</div>
				<div class="in">
					<table cellpadding="0" cellspacing="0" width="100%">
						<thead>
						<tr>
							<th>Timestamp</th>
							<th>Name</th>
							<th>Status change</th>
							<th>Value change</th>
						</tr>
						</thead>
						<tbody>
						<msk:iterate name="alerts" type="net.java.dev.moskito.webui.bean.ThresholdAlertBean" id="alert" indexId="index">
							<tr class="<%= ((index & 1) == 0 )? "even" : "odd" %>">
								<td><msk:write name="alert" property="timestamp"/></td>
								<td><a href=""><msk:write name="alert" property="name"/></a></td>
								<td>
									<img src="../img/ind_<msk:write name="alert" property="oldColorCode"/>.png" alt="<msk:write name="alert" property="oldStatus"/>"/>
										&nbsp;<img src="../img/ind_arrow.png" alt="-->"/>&nbsp;
									<img src="../img/ind_<msk:write name="alert" property="newColorCode"/>.png" alt="<msk:write name="alert" property="newStatus"/>"/>
								</td>
								<td>
									<msk:write name="alert" property="oldValue"/>
										&nbsp;<img src="../img/ind_arrow.png" alt="-->"/>&nbsp;
									<msk:write name="alert" property="newValue"/>
								</td>
							</tr>
						</msk:iterate>
						</tbody>
					</table>
					<div class="clear"><!-- --></div>
				</div>
				<div class="bot">
					<div class="left"><!-- --></div>
					<div class="right"><!-- --></div>
				</div>
			</div>
		</div>
		<div class="bot">
			<div class="left"><!-- --></div>
			<div class="right"><!-- --></div>
		</div>
	</div>
</body>
<div class="lightbox" style="display:none;">
	<div class="black_bg"><!-- --></div>
	<div class="box">
		<div class="box_top">
			<div><!-- --></div>
			<span><!-- --></span>
			<a class="close_box"><!-- --></a>

			<div class="clear"><!-- --></div>
		</div>
		<div class="box_in">
			<div class="right">
				<div class="text_here thresholdOverlay">
					<span>Name: </span><b id="name"></b><br/>
					<span>producerName: </span><b id="producerName"></b><br/>
					<span>statName: </span><b id="statName"></b><br/>
					<span>valueName: </span><b id="valueName"></b><br/>
					<span>intervalName: </span><b id="intervalName"></b><br/>
					<span>descriptionString: </span><b id="descString"></b><br/>
					<div class="scroll">
						<table cellpadding="0" cellspacing="0" border="0">
							<thead>
							<tr>
								<th>Guards</th>
							</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="box_bot">
			<div><!-- --></div>
			<span><!-- --></span>
		</div>
	</div>
</div>
</html>  