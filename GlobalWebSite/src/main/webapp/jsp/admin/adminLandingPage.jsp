<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>
    <meta charset="utf-8">
    <title>Admin Panel</title>
    <meta name="keywords" content="GlobalWebsite" />
    <meta name="description" content="GlobalWebsite">
    <meta name="author" content="GlobalWebsite">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/jsp/admin/adminHeaderLinks.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/theme/usernewdesign/welcome.css">
    <style type="text/css">
      element.style {
      }
      .box.box-primary {
      border-top-color: #3c8dbc;
      }
      .box {
      position: relative;
      border-radius: 3px;
      background: #ffffff;
      border-top: 3px solid #d2d6de;
      margin-bottom: 20px;
      width: 100%;
      box-shadow: 0 1px 1px rgba(0,0,0,0.05);
      }
      .box-header {
      color: #444;
      display: block;
      padding: 10px;
      position: relative;
      }
      .todo-list {
      .box {
      position: relative;
      border-radius: 3px;
      background: #ffffff;
      border-top: 3px solid #d2d6de;
      margin-bottom: 20px;
      width: 100%;
      box-shadow: 0 2px 2px rgba(0, 0, 0, 0.05);
      /* border-radius: 15px 25px; */
      }
      .box.box-primary {
      border-top-color: #3c8dbc
      }
      .box.box-info {
      border-top-color: #00c0ef
      }
      .box.box-danger {
      border-top-color: #dd4b39
      }
      .box.box-warning {
      border-top-color: #f39c12
      }
      .box.box-success {
      border-top-color: #00a65a
      }
      .box.box-default {
      border-top-color: #d2d6de
      }
      .box.box-purple {
      border-top-color: #605ca8
      }
      .box .nav-stacked>li {
      border-bottom: 1px solid #f4f4f4;
      margin: 0
      }
      .box .nav-stacked>li:last-of-type {
      border-bottom: none
      }
      .box.height-control .box-body {
      max-height: 300px;
      overflow: auto
      }
      .box .border-right {
      border-right: 1px solid #f4f4f4
      }
      .box .border-left {
      border-left: 1px solid #f4f4f4
      }
      .box.box-solid {
      border-top: 0px
      }
      .box.box-solid>.box-header .btn.btn-default {
      background: transparent
      }
      .box.box-solid>.box-header .btn:hover, .box.box-solid>.box-header a:hover
      {
      background: rgba(0, 0, 0, 0.1) !important
      }
      .box.box-solid.box-default {
      border: 1px solid #d2d6de
      }
      .box.box-solid.box-default>.box-header {
      color: #444;
      background: #d2d6de;
      background-color: #d2d6de
      }
      .box.box-solid.box-default>.box-header a, .box.box-solid.box-default>.box-header .btn
      {
      color: #444
      }
      .box.box-solid.box-primary {
      border: 1px solid #3c8dbc
      }
      .box.box-solid.box-primary>.box-header {
      color: #fff;
      background: #3c8dbc;
      background-color: #3c8dbc
      }
      .box.box-solid.box-primary>.box-header a, .box.box-solid.box-primary>.box-header .btn
      {
      color: #fff
      }
      .box.box-solid.box-info {
      border: 1px solid #00c0ef
      }
      .box.box-solid.box-info>.box-header {
      color: #fff;
      background: #00c0ef;
      background-color: #00c0ef
      }
      .box.box-solid.box-info>.box-header a, .box.box-solid.box-info>.box-header .btn
      {
      color: #fff
      }
      .box.box-solid.box-danger {
      border: 1px solid #dd4b39
      }
      .box.box-solid.box-danger>.box-header {
      color: #fff;
      background: #dd4b39;
      background-color: #dd4b39
      }
      .box.box-solid.box-danger>.box-header a, .box.box-solid.box-danger>.box-header .btn
      {
      color: #fff
      }
      .box.box-solid.box-warning {
      border: 1px solid #f39c12
      }
      .box.box-solid.box-warning>.box-header {
      color: #fff;
      background: #f39c12;
      background-color: #f39c12
      }
      .box.box-solid.box-warning>.box-header a, .box.box-solid.box-warning>.box-header .btn
      {
      color: #fff
      }
      .box.box-solid.box-success {
      border: 1px solid #00a65a
      }
      .box.box-solid.box-purple {
      border: 1px solid #605ca8
      }
      .box.box-solid.box-success>.box-header {
      color: #fff;
      background: #00a65a;
      background-color: #00a65a
      }
      .box.box-solid.box-purple>.box-header {
      color: #fff;
      background: #605ca8;
      background-color: #605ca8
      }
      .box.box-solid.box-success>.box-header a, .box.box-solid.box-success>.box-header .btn
      {
      color: #fff
      }
      .box.box-solid.box-purple>.box-header a, .box.box-solid.box-purple>.box-header .btn
      {
      color: #fff
      }
      .box.box-solid>.box-header>.box-tools .btn {
      border: 0;
      box-shadow: none
      }
      .box.box-solid.collapsed-box .box-body, .box.box-solid.collapsed-box .box-footer
      {
      display: none
      }
      .box.box-solid[class*='bg']>.box-header {
      color: #fff
      }
      .box .box-group>.box {
      margin-bottom: 5px
      }
      .box .knob-label {
      text-align: center;
      color: #333;
      font-weight: 100;
      font-size: 12px;
      margin-bottom: 0.3em
      }
      .box>.overlay, .box>.loading-img {
      position: absolute;
      top: -3px;
      left: 0;
      width: 100%;
      height: 100%
      }
      .box .overlay {
      z-index: 1010;
      background: rgba(255, 255, 255, 0.7);
      border-radius: 3px
      }
      .box .overlay>.fa {
      position: absolute;
      top: 50%;
      left: 50%;
      margin-left: -15px;
      margin-top: -15px;
      color: #000;
      font-size: 30px
      }
      .box .overlay.dark {
      background: rgba(0, 0, 0, 0.5)
      }
      .box-header {
      color: #444;
      display: block;
      padding: 10px;
      position: relative
      }
      .box-header:before, .box-header:after {
      content: " ";
      display: table
      }
      .box-header:after {
      clear: both
      }
      .box-header.with-border {
      border-bottom: 1px solid #f4f4f4
      }
      .collapsed-box .box-header.with-border {
      border-bottom: none
      }
      .box-header>.fa, .box-header>.glyphicon, .box-header>.ion, .box-header .box-title
      {
      display: inline-block;
      font-size: 18px;
      margin: 0;
      line-height: 1
      }
      .box-header>.fa, .box-header>.glyphicon, .box-header>.ion {
      margin-right: 5px
      }
      .box-header>.box-tools {
      position: absolute;
      right: 10px;
      top: 5px
      }
      .box-header>.box-tools [data-toggle="tooltip"] {
      position: relative
      }
      .box-header>.box-tools.pull-right .dropdown-menu {
      right: 0;
      left: auto
      }
      .btn-box-tool {
      padding: 5px;
      font-size: 12px;
      background: transparent;
      box-shadow: none !important;
      color: #97a0b3
      }
      .open .btn-box-tool, .btn-box-tool:hover {
      color: #606c84
      }
      .btn-box-tool:active {
      outline: none !important
      }
      .box-body {
      border-top-left-radius: 0;
      border-top-right-radius: 0;
      border-bottom-right-radius: 3px;
      border-bottom-left-radius: 3px;
      padding: 10px
      } 
      .no-header .box-body {
      border-top-right-radius: 3px;
      border-top-left-radius: 3px
      }
      .box-body>.table {
      margin-bottom: 0
      }
    </style>
  </head>
  <body class="theme-success">
    <%@include file="/jsp/admin/adminThemeChange.jsp" %>
    <%@include file="/jsp/admin/adminTopMenu.jsp" %>
    <%@include file="/jsp/admin/adminLeftMenu.jsp" %>
    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper">
      <div class="col-md-12">
        <div class="bs-component">
          <div class="panel">
            <div class="panel-body">
              <div class="tab-content pn br-n">
                <div id="tab2_1" class="tab-pane active">
                  <div class="row">
                    <div class="col-md-12">
                      Welcome
                      <div class="box box-primary">
                        <div class="col-md-12">
                          <div class="box-body">
                            <br>
                            <span id="dayMsg"> </span>,  ${welcomemsg}
                          </div>
                          <!-- /.box-body -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <%@include file="/jsp/admin/adminBodyScriptLinks.jsp" %>
    <script>
      jQuery(document).ready(function() {
        var greeting;
        var time = new Date().getHours();
        if (time < 10) {
          greeting = "Good morning";
        } else if (time < 16) {
          greeting = "Good afeternoon";
        } else {
          greeting = "Good evening";
        }
        document.getElementById("dayMsg").innerHTML = greeting;
      });
    </script>
  </body>
</html>