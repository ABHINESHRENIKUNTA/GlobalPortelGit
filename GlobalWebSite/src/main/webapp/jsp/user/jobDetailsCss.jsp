    <link href="${pageContext.request.contextPath}/theme/usernewdesign/jobDetailsCss.css" rel="stylesheet" type="text/css" />
<style>
.filterjob {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	display: inline-block;
	position: relative;
	background-color: #0275d8;
	color: #FFFFFF;
	top: 1px;
	height: 20px;
	width: 20px;
	border: 0;
	border-radius: 50px;
	cursor: pointer;
	margin-right: 7px;
	outline: none;
}

.filterjob:checked::before {
	position: absolute;
	font: 15px/1 'Open Sans', sans-serif;
	left: 5px;
	top: 1px;
	content: '\02143';
	transform: rotate(40deg);
}

.filterjob:hover {
	background-color: #5cb85c;
}

.filterjob:checked {
	background-color: #0275d8;
}
.count-class{
padding-right: 10px;padding-top: 8px;

}

.optionlist li{
padding-left: 0px !important;
}
</style>