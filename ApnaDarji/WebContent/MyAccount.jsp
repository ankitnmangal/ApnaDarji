<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"  href="resources/favicon.png"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Account</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="MyAccount.css">
<!-- <link rel="import" href="NavBar.jsp"> -->


<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		$('#myAccount-personalInfo').show();
	});
	
	function showShirtMeasurementImage(obj){
		$('#shirt-measure-img').prop('src','resources/mario1.jpg');
	}
	
	function showPerInfo() {
		$('.myAccount').hide(500);
		$('#myAccount-personalInfo').show(500);
	}
	function showEditPerInfo() {
		$('.myAccount').hide(500);
		$('#myAccount-personalInfo-edit').show(500);
	}
	
	function showEditShirtMeasurement(obj){
		$('.myAccount').hide(500);
		$('#edit-saved-shirt-measurement-title-box').children('h2').text("EDIT SHIRT MEASUREMENT");
		$('#edit-shirt-measure-form').prop('action','UpdateShirtMeasurementAction');
		$('#edit-shirt-measure-form').children('#edit-shirtMeasurementId').prop('value',$(obj).siblings("#shirtMeasurementId").attr('value'));
		$('#edit-collar').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#collar').text());
		$('#edit-halfChest').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#halfChest').text());
		$('#edit-halfWaist').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#halfWaist').text());
		$('#edit-halfHips').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#halfHips').text());
		$('#edit-sleeveLength').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#sleeveLength').text());
		$('#edit-elbow').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#elbow').text());
		$('#edit-foreArm').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#foreArm').text());
		$('#edit-halfBicep').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#halfBicep').text());
		$('#edit-cuff').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#cuff').text());
		$('#edit-yoke').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#yoke').text());
		$('#edit-shirtLength').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#shirtLength').text());
		$('#edit-sleeveLength').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#sleeveLength').text());
		$('#edit-halfArmhole').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#halfArmhole').text());
		$('#edit-shortSleeveLength').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#shortSleeveLength').text());
		$('#edit-shortSleeveOpening').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#shortSleeveOpening').text());
		$('#myAccount-saved-shirt-edit-box').show(500);
	}
	
	function showNewShirtMeasurementForm(){
		$('.myAccount').hide(500);
		$('#edit-saved-shirt-measurement-title-box').children('h2').text("ADD A NEW SHIRT MEASUREMENT");
		$('#edit-shirt-measure-form').prop('action','AddShirtMeasurementAction');
		$('#myAccount-saved-shirt-edit-box').show(500);
	}
	
	function showSavedShirtMeasurements(){
		$('#saved-shirt-measurement-title-box').children('h2').text("Your SAVED SHIRT MEASUREMENT");
		$('.myAccount').hide(500);
		$("#myAccount-savedShirtMeasurement").show(500);
	}
	
	function showEditTrouserMeasurement(obj){
		$('.myAccount').hide(500);
		$('#edit-saved-trouser-measurement-title-box').children('h2').text("EDIT TROUSER MEASUREMENT");
		$('#edit-trouser-measure-form').prop('action','UpdateTrouserMeasurementAction');
		$('#edit-trouser-measure-form').children('#edit-trouserMeasurementId').prop('value',$(obj).siblings("#trouserMeasurementId").attr('value'));
		$('#edit-waist').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#waist').text());
		$('#edit-hips').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#hips').text());
		$('#edit-crotch').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#crotch').text());
		$('#edit-thighWidth').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#thighWidth').text());
		$('#edit-pantsLength').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#pantsLength').text());
		$('#edit-inseam').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#inseam').text());
		$('#edit-knee').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#knee').text());
		$('#edit-halfHem').prop('value',$(obj).parent('form').parent('div').siblings('div').children('p').children('#halfHem').text());
		$('#myAccount-saved-pant-edit-box').show(500);
	} 
	
	function showNewTrouserMeasurementForm(){
		$('.myAccount').hide(500);
		$('#edit-saved-trouser-measurement-title-box').children('h2').text("ADD A NEW TROUSER MEASUREMENT");
		$('#edit-trouser-measure-form').prop('action','AddTrouserMeasurementAction');
		$('#myAccount-saved-pant-edit-box').show(500);
	}
	
	function showSavedTrouserMeasurements(){
		$('.myAccount').hide(500);
		$('#saved-trouser-measurement-title-box').children('h2').text("Your SAVED TROUSER MEASUREMENT");
		$("#myAccount-savedPantMeasurement").show(500);
	}
	 
	function showEditSavedAddr(obj) {
		$('.myAccount').hide(500);
		$('#edit-saved-add-title-box').children('h2').text("EDIT ADDRESS");
		$('#edit-addr-form').prop('action','UpdateAddressAction');
		$('#edit-addr-form').children('#edit-addrId').prop('value',$(obj).siblings("#addrId").attr('value'));
		$('#edit-userName').prop('value',$(obj).parent('form').parent('li').siblings('li').children('#userName').text());
		$('#edit-houseNum').prop('value',$(obj).parent('form').parent('li').siblings('li').children('#houseNum').text());
		$('#edit-addressLine1').prop('value',$(obj).parent('form').parent('li').siblings('li').children('#addressLine1').text());
		$('#edit-addressLine2').prop('value',$(obj).parent('form').parent('li').siblings('li').children('#addressLine2').text());
		$('#edit-city').prop('value',$(obj).parent('form').parent('li').siblings('li').children('#city').text());
		$('#edit-state').prop('value',$(obj).parent('form').parent('li').siblings('li').children('#state').text());
		$('#edit-postalCode').prop('value',$(obj).parent('form').parent('li').siblings('li').children('#postalCode').text());
		$('#myAccount-saved-add-edit-box').show(500);
	}
	
	function showNewAddressform(){
		$('.myAccount').hide(500);
		$('#edit-saved-add-title-box').children('h2').text("ADD A NEW ADDRESS");
		$('#edit-addr-form').prop('action','AddAddressAction');
		$('#myAccount-saved-add-edit-box').show(500);
	}
	
	function showSavedAddresses(){
		$('.myAccount').hide(500);
		$("#myAccount-savedAdd").show(500);
	}
	function changeTab(obj) {
		// 		alert(obj.id);
		$(obj).siblings('li').removeClass('tab-selected');
		$(obj).addClass('tab-selected');
		$('.myAccount').hide(500);
		if (obj.id == "per-info") {
			$("#myAccount-personalInfo").show(500);
		} 
		else 
		{
			if (obj.id == "sav-add") 
			{
				$("#myAccount-savedAdd").show(500);
			} 
			else 
			{
				if (obj.id == "sav-shirt-mas")
				{
					$("#myAccount-savedShirtMeasurement").show(500);
				}
				else 
				{
					if (obj.id == "sav-pant-mas")
					{
						$("#myAccount-savedPantMeasurement").show(500);
					}
				}
			}
		}
	}
</script>
</head>
<body>
	<div id="nav-bar-include">
		<s:include value="NavBar.jsp"></s:include>
	</div>
	<div id="main-outer-box">
		<div id="tab-box">
			<ul>
				<li id="per-info" onClick="changeTab(this)" class="tab-selected">
				<abbr>PERSONAL INFO</abbr>
				</li>
				<li id="sav-add" onClick="changeTab(this)">
				<abbr>SAVED	ADDRESSES</abbr>
				</li>
				<li id="sav-shirt-mas" onClick="changeTab(this)">
				<abbr>SHIRT MEASURMENTS</abbr>
				</li>
				<li id="sav-pant-mas" onClick="changeTab(this)">
				<abbr>TROUSER MEASURMENTS</abbr>
				</li>
			</ul>
		</div>
		<div class="myAccount" id="myAccount-personalInfo">
			<div id="per-info-title-box">
				<h2>YOUR PERSONAL INFORMATION</h2>
			</div>
			<div id="per-info-box">
				<ul>
					<li>
						<div id="h2-width">
							<h2>NAME</h2>
						</div>
						<h2><s:property value="firstName"/></h2>
					</li>
					<li>
						<div id="h2-width">
							<h2>EMAIL</h2>
						</div>
						<h2><s:property value="emailId"/></h2>
					</li>
					<li>
						<div id="h2-width">
							<h2>PASSWORD</h2>
						</div>
						<h2>**********</h2>
					</li>
					<li>
						<div id="h2-width">
							<h2>MOBILE(+91):</h2>
						</div>
						<h2><s:property value="phNo"/></h2>
					</li>
					<li>
						<div id="h2-width">
							<h2>REGISTERED ON:</h2>
						</div>
						<h2> <s:property value="DOReg"/> </h2>
					</li>
					<li><input id="edit-info-but" type="button" value="EDIT INFO" onClick="showEditPerInfo()"></li>
				</ul>
			</div>
		</div>
		<div class="myAccount" id="myAccount-personalInfo-edit">
			<div id="edit-info-title-box">
				<h2>EDIT YOUR PERSONAL INFORMATION</h2>
			</div>
			<div id="per-info-box">
				<form action="UpdateProfileAction" method="post">
					<ul>
						<li>
							<div id="h2-width">
								<h2>FIRST NAME</h2>
							</div> 
							<input class="text-boxes" type="text" placeholder="<s:property value="firstName"/>" name="firstName" />
						</li>
						<li>
							<div id="h2-width">
								<h2>LAST NAME</h2>
							</div> 
							<input class="text-boxes" type="text" placeholder="<s:property value="lastName"/>" name="lastName" />
						</li>
						<li>
							<div id="h2-width">
								<h2>EMAIL</h2>
							</div> <input class="text-boxes" pattern='[^@]+@[^@]+\.[a-zA-Z]{2,}'
							type="email" placeholder="<s:property value="emailId"/>"
							name="emailId" />
						</li>
						<li>
							<div id="h2-width">
								<h2>PASSWORD</h2>
							</div> <a href="javaScript:Void();" onClick="changePass()">CHANGE
								PASSWORD</a>
						</li>
						<li>
							<div id="h2-width">
								<h2>MOBILE(+91):</h2>
							</div> <input class="text-boxes" maxlength="10" pattern='[789][0-9]{9}'
							type="phone" placeholder="<s:property value="PrimaryContactNO"/>" name="contact.primaryContactNumber" />
						</li>
						<li>
							<div id="h2-width">
								<h2>BIRTH DATE:</h2>
							</div> 
							<input class="text-boxes" type="phone"
									placeholder="(format: dd-mm-yyyy)"
									name="DOB" />
						</li>
						<li>
							<input id="edit-info-save-but" type="submit" value="SAVE" />
							<input id="edit-info-cancel-but" type="button" value="CANCEL" onclick="showPerInfo()"/>
						</li>
					</ul>
				</form>
			</div>
		</div>
		<div class="myAccount" id="myAccount-savedAdd">
			
			<s:if test="addrList.isEmpty()">
			<div id="saved-add-title-box">
				<h2>NO SAVED ADDRESSES</h2>
				<input id="addnewadd-but" type="button" value="ADD A NEW ADDRESS" onclick="showNewAddressform()">
			</div>
				<div  style="margin: 100px 0 0; text-align: center; padding: 0">
					<h6>You does not have any saved address.</h6> 
					<br><p>Please <a href="javascript:void()" onclick="showNewAddressform()">ADD A NEW ADDRESS</a> </p>
				</div>
			</s:if>
			<s:else>
			<div id="saved-add-title-box">
				<h2>YOUR SAVED ADDRESSES</h2>
				<input id="addnewadd-but" type="button" value="ADD A NEW ADDRESS" onclick="showNewAddressform()">
			</div>
				<s:iterator value="addrList">
					<div id="saved-add-box">
						<div id="address-title-div">
							<h4>ADDRESS TITLE</h4>
						</div>
						<ul>
							<li>
								<address id="userName"> <s:property value="userName"/> </address>
								<address id="houseNum"> <s:property value="houseNum"/>,</address>
								<address id="addressLine1"> <s:property value="addressLine1"/>,</address>
								<address id="addressLine2"> <s:property value="addressLine2"/>,</address>
								<address id="city"> <s:property value="city"/>,</address>
								<address id="state"> <s:property value="state"/>.</address>
								Postal	code: <address id="postalCode"> <s:property value="postalCode"/></address>
							</li>
							<li> 
								<form action="DeleteAddressAction" method="POST">
									<input id="addrId" type="hidden" name="addrId" value="<s:property value='addrId'/>"/>
									<input id="edit-add-but" type="button" value="EDIT INFO" onclick="showEditSavedAddr(this)"> 
									<input id="del-add-but"	type="submit" value="DELETE">
								</form>
							</li>
						</ul>
					</div>
				</s:iterator>
			</s:else>
		</div>
		<div  class="myAccount" id="myAccount-saved-add-edit-box">
			<div id="edit-saved-add-title-box">
				<h2>EDIT ADDRESS</h2>
			</div>
			<div id="saved-add-edit-box">
				<form id="edit-addr-form" action="UpdateAddressAction" method="post">
					<input id="edit-addrId" type="hidden" name="addrId"/>
					<ul>
						<li>
							<input type="radio" name="addressType" value="home" checked="checked"><span>HOME</span>
							<input type="radio" name="addressType" value="office"><span>OFFICE</span>
						</li>
						<li>
							<input id="edit-userName" class="textbox" type="text" placeholder="NAME" name="userName" required />
						</li>
						<li>
							<input id="edit-houseNum" class="textbox" type="text" placeholder="HOUSE NUMBER" name="houseNum" required />
						</li>
						<li>
							<textarea style="height: 40px;" id="edit-addressLine1" placeholder="ADDRESS LINE 1" name="addressLine1" required></textarea>
						</li>
						<li>
							<textarea  id="edit-addressLine2" placeholder="ADDRESS LINE 2" name="addressLine2" required></textarea>
						</li>
						<li>
							<input id="edit-postalCode" name="postalCode" class="textbox" type="text" placeholder="postalCode" required /> 
						</li>
						<li>
							<input id="edit-city" name="city" class="textbox inline-class" type="text" placeholder="CITY" required /> 
						  	<input id="edit-state" name="state" class="textbox inline-class" type="text" placeholder="STATE" required />
						</li>
						<li>
							<input id="edit-alternateContactNumber" name="alternateContactNumber" class="textbox inline-class" type="text" placeholder="MOBILE No" required />
						</li>
						<li>
							<input class="inline-class add-save-but" type="submit" value="SAVE"> 
							<input class="inline-class add-cancel-but" 	type="button" value="CANCEL" onclick="showSavedAddresses()">
						</li>
					</ul>
				</form>
			</div>
		</div>
		
		<div class="myAccount" id="myAccount-savedShirtMeasurement">
			<div id="saved-shirt-measurement-title-box">
				<h2>YOUR SAVED SHIRT MEASUREMENTS</h2>
				<input id="addnewshirt-but" type="button" value="ADD A NEW SHIRT MEASUREMENT" onclick="showNewShirtMeasurementForm()">
			</div>
			<s:iterator value="shirtMeasureList">
				<div id="saved-shirt-box">
					<div id="shirt-measure-title-div">
							<h4>SHIRT MEASUREMENT TITLE</h4>
					</div>
					<div>
						<p>collar:<span id="collar"><s:property value="collar"/> </span></p> 
						<p>halfChest:<span id="halfChest"> <s:property  value="halfChest"/></span></p> 
						<p>halfWaist:<span id="halfWaist"> <s:property  value="halfWaist"/></span></p> 
						<p>halfHips: <span id="halfHips"> <s:property  value="halfHips"/></span></p>
						<p>sleeveLength: <span id="sleeveLength"> <s:property  value="sleeveLength"/></span></p>
						<p>elbow: <span id="elbow"> <s:property  value="elbow"/></span></p>
						<p>foreArm: <span id="foreArm"> <s:property  value="foreArm"/></span></p>
						<p>halfBicep:<span id="halfBicep"> <s:property  value="halfBicep"/></span></p>
						<p>cuff: <span id="cuff"> <s:property  value="cuff"/></span></p>
						<p>yoke: <span id="yoke"> <s:property  value="yoke"/></span></p>
						<p>shirtLength: <span id="shirtLength"> <s:property  value="shirtLength"/></span></p>
						<p>halfArmhole: <span id="halfArmhole"> <s:property  value="halfArmhole"/></span></p>
						<p>shortSleeveLength: <span id="shortSleeveLength"> <s:property  value="shortSleeveLength"/></span></p>
						<p>shortSleeveOpening: <span id="shortSleeveOpening"> <s:property value="shortSleeveOpening"/></span></p>
					</div>
					<div style="padding: 10px 10px 10px 25px;">
						<form action="DeleteShirtMeasurementAction" method="POST">
							<input id="shirtMeasurementId" type="hidden" name="shirtMeasurementId" value="<s:property value='shirtMeasurementId'/>"/>
							<input id="edit-shirt-measure-but" type="button" value="EDIT INFO" onClick="showEditShirtMeasurement(this)"> 
							<input id="del-shirt-measure-but"	type="submit" value="DELETE">
						</form>
					</div>
				</div>
			</s:iterator>
		</div>
		
		<div  class="myAccount" id="myAccount-saved-shirt-edit-box">
			<form id="edit-shirt-measure-form" action="UpdateShirtMeasurementAction" method="post">
				<div id="edit-saved-shirt-measurement-title-box">
					<h2>EDIT SHIRT MEASUREMENT</h2>
					<input type="text" name="shirtMeasurementName" placeholder="Name for this Measurement"><br>
					<abbr>Save Measurements In</abbr> <select name="measure-unit">
						  <option value="cm">Centimeter</option>
						  <option value="inch">Inches</option>
					</select> 
				</div>
				<input id="edit-shirtMeasurementId" type="hidden" name="shirtMeasurementId"/>
				<div class="editboxandbuttons" id="edit-shirt-measurement-div">
					<div class="editboxandbuttons-inlinediv">
						<p>collar: <input id="edit-collar" name="collar" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>halfChest: <input id="edit-halfChest" name="halfChest" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>halfWaist: <input id="edit-halfWaist" name="halfWaist" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>sleeveLength: <input id="edit-sleeveLength" name="sleeveLength" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>elbow: <input id="edit-elbow" name="elbow" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>foreArm: <input id="edit-foreArm" name="foreArm" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>halfBicep: <input id="edit-halfBicep" name="halfBicep" type="text" onclick="showShirtMeasurementImage(this)"></p>
	 				</div>
					
					<div  class="editboxandbuttons-inlinediv">
						<img id="shirt-measure-img" src="resources/mario2.jpg">
					</div>
					<div  class="editboxandbuttons-inlinediv">
						
						<p>cuff: <input id="edit-cuff"  name="cuff" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>yoke: <input id="edit-yoke"  name="yoke" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>shirtLength: <input id="edit-shirtLength" name="shirtLength" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>halfArmhole: <input id="edit-halfArmhole" name="halfArmhole" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>halfHips: <input id="edit-halfHips" name="halfHips" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>shortSleeveLength: <input id="edit-shortSleeveLength" name="shortSleeveLength" type="text" onclick="showShirtMeasurementImage(this)"></p>
						<p>shortSleeveOpening: <input id="edit-shortSleeveOpening" name="shortSleeveOpening" type="text" onclick="showShirtMeasurementImage(this)"></p>
					</div>
				</div>
				<div class="editboxandbuttons"  style="padding: 20px 10px 10px 0; text-align: center;">
						<input id="edit-shirt-measure-but" type="submit" value="SAVE MEASUREMENT"> 
						<input id="del-shirt-measure-but"	type="button" value="CANCEL" onClick="showSavedShirtMeasurements()">
				</div>
			</form>
		</div>
		
		<div class="myAccount" id="myAccount-savedPantMeasurement">
			<div id="saved-trouser-measurement-title-box">
				<h2>YOUR SAVED TROUSER MEASUREMENTS</h2>
				<input id="addnewpant-but" type="button" value="ADD A NEW TROUSER MEASUREMENT" onclick="showNewTrouserMeasurementForm()">
			</div>
				<s:iterator value="trouserMeasureList">
					<div id="saved-pant-box">
						<div id="trouser-measure-title-div">
							<h4>TROUSER MEASUREMENT TITLE</h4>
						</div>
						<div>
							<p>waist: <span  id="waist"><s:property value="waist"/></span></p>
							<p>hips: <span id="hips"><s:property  value="hips"/></span></p>
							<p>crotch: <span id="crotch"><s:property value="crotch"/></span></p>
							<p>thighWidth: <span  id="thighWidth"><s:property value="thighWidth"/></span></p>
							<p>pantsLength: <span id="pantsLength"> <s:property value="pantsLength"/></span></p>
							<p>inseam: <span  id="inseam"> <s:property value="inseam"/></span></p>
							<p>knee: <span id="knee"> <s:property  value="knee"/></span></p> 
							<p>halfHem: <span id="halfHem"><s:property  value="halfHem"/></span></p>
						</div>
						<div style="padding: 10px 10px 10px 25px;">
						<form action="DeleteTrouserMeasurementAction" method="POST">
							<input id="trouserMeasurementId" type="hidden" name="trouserMeasurementId" value="<s:property value='trouserMeasurementId'/>"/>
							<input id="edit-shirt-measure-but" type="button" value="EDIT INFO" onclick="showEditTrouserMeasurement(this)"> 
							<input id="del-shirt-measure-but" type="submit" value="DELETE">
						</form>
						</div>
					</div>
				</s:iterator>
		</div>
		<div  class="myAccount" id="myAccount-saved-pant-edit-box">
			<form id="edit-trouser-measure-form" action="UpdateTrouserMeasurementAction" method="post">
				<div id="edit-saved-trouser-measurement-title-box">
					<h2>EDIT TROUSER MEASUREMENT</h2>
					<input type="text" name="trouserMeasurementName" placeholder="Name for this Measurement"><br>
					<abbr>Save Measurements In</abbr> <select name="measure-unit">
						  <option value="cm">Centimeter</option>
						  <option value="inch">Inches</option>
					</select> 
				</div>
				<input id="edit-trouserMeasurementId" type="hidden" name="trouserMeasurementId"/>
				<div id="edit-pant-measurement-div" class="editboxandbuttons">
					
					<div class="editboxandbuttons-inlinediv">
						<p>waist: <input id="edit-waist" name="waist" type="text"></p>
						<p>hips: <input id="edit-hips" name="hips" type="text"></p>
						<p>crotch: <input id="edit-crotch" name="crotch" type="text"></p>
						<p>thighWidth: <input id="edit-thighWidth" name="thighWidth" type="text"></p>
	 				</div>
					
					<div  class="editboxandbuttons-inlinediv">
						<img  src="resources/mario2.jpg">
					</div>
					
					<div  class="editboxandbuttons-inlinediv">
						<p>pantsLength: <input id="edit-pantsLength" name="pantsLength" type="text"></p>
						<p>inseam: <input id="edit-inseam" name="inseam" type="text"></p>
						<p>knee: <input id="edit-knee" name="knee" type="text"></p>
						<p>halfHem: <input id="edit-halfHem" name="halfHem" type="text"></p>
					</div>
					
				</div>
				<div class="editboxandbuttons"  style="padding: 20px 10px 10px 0; text-align: center;">
						<input id="edit-shirt-measure-but" type="submit" value="SAVE MEASUREMENT"> 
						<input id="del-shirt-measure-but"	type="button" value="CANCEL" onclick="showSavedTrouserMeasurements()">
				</div>
			</form>
		</div>
	</div>
</body>
</html>