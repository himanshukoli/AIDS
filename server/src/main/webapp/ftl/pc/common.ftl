<#import "/spring.ftl" as spring />
<#macro page title="" activeTab="">
<!DOCTYPE html>
<html>
<head>
    <#if activeTab!="">
        <meta name="activeTab" content="${activeTab?string}"/></#if>
    <#if title!=""><title>${title?html}</title></#if>
    <link rel="Shortcut Icon" href="/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="${rc.getContextPath()}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${rc.getContextPath()}/resources/bootstrap/css/navbar-fixed-top.css" rel="stylesheet">
    <#--<link href="${rc.getContextPath()}/resources/bootstrap/css/sticky-footer-navbar.css" rel="stylesheet">-->

    <script src="${rc.getContextPath()}/resources/js/jquery-2.1.0.min.js"></script>
    <script src="${rc.getContextPath()}/resources/bootstrap/js/bootstrap.min.js"></script>

    <meta name="description" content="AIDS">
    <meta name="author" content="aids">
    <meta http-equiv="Content-type" content="text/html; charset=${.output_encoding}">

    <style type="text/css">
        body {
            padding-top: 10px;
            padding-bottom: 20px;
        }
        .container {
            width: 90%;
        }
        .container-narrow > hr {
            margin: 30px 0;
        }
    </style>
</head>
<body>
    <#include "header.ftl"/>
<div class="container">
    <#if title!=""><p class="lead">${title?html}</p></#if>
    <#nested>
    <#include "footer.ftl"/>
</div>
</body>
</html>
</#macro>