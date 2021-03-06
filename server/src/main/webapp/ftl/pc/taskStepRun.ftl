<#import "common.ftl" as com>
<#escape x as x?html>
    <@com.page activeTab="history">

    <style>
        .layer1 {
            width: 600px;
            padding: 0;
            margin: 0;
            cursor: pointer;
        }

        .heading {
            /*margin-bottom: 10px;*/
        }

        .content {
            padding: 5px 10px;
            background-color: #fafafa;
        }

        .taskStepEdit:hover {
            /*background: yellow;*/
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.content').hide();
            $('.heading').click(function () {
                var targetSpan = '#span_'+this.id;
                $.get('../viewLogs/'+this.id, function(data) {
                    $(targetSpan).html(data);
                });
                $('#content_' + this.id).slideToggle(300);
//                $(this).next('.content').slideToggle(300);
            })
        });
    </script>

    <!--div class="well">
        <fieldset>
            <legend>Search Tasks</legend>
            <form id="user" class="form-inline" name="resource" modelAttribute="resource" action="search" method="post">
                <div class="row">
                    <div class="col-lg-4">
                        <input type="text" class="form-control" placeholder="Type something to search.." name="search"">
                    </div>
                    <button type="submit" class="btn btn-default" id="save">Search</button>
                </div>
            </form>
        </fieldset>
    </div-->
    <br>
    <hr/>
    <a href="../team/${model.taskHistory.team.id}/taskHistory"> << Back To Task History</a>
    <div class="well">
        <table class="table table-striped table-condensed">
            <tr>
                <th>Id</th>
                <th>Seq</th>
                <th>Title</th>
                <th>Agent</th>
                <th>Updated</th>
                <th>Status</th>
                <th>Operation</th>
            </tr>
            <#list model.taskHistory.taskStepRuns as taskStepRun>
                <#if taskStepRun.runStatus?string == 'FAILURE'>
                <tr class="text-danger">
                <#elseif taskStepRun.runStatus?string == 'NOT_RUN'>
                <tr class="text-warning">
                <#else >
                <tr class="text-success"></#if>
                <td>${taskStepRun.id?string}</td>
                <td>${taskStepRun.sequence?string}</td>
                <td>${taskStepRun.taskStep.description!?string}</td>
                <td>${taskStepRun.agent.name!?string}</td>
                <td><#if taskStepRun.finishTime??>${taskStepRun.finishTime?datetime?string("dd MMM, yyyy hh.mm aa")}</#if></td>
                <#if taskStepRun.runStatus?string == 'FAILURE'>
                    <td>
                        <button type="button" class="btn btn-danger">${taskStepRun.runStatus!?string}</button>
                    </td>
                <#else >
                    <td>
                        <button type="button" class="btn btn-success">${taskStepRun.runStatus!?string}</button>
                    </td>
                </#if>
                <td>
                    <#if taskStepRun.runStatus!?string == 'RUNNING'>
                        <a id="${taskStepRun.id}" href="${rc.contextPath}/server/getMemoryLogs/view/${taskStepRun.id}" target="_blank">tail logs</a>
                    <#else>
                        <a class="btn btn-small btn-primary viewTaskLogs heading" id="${taskStepRun.id}"
                           href="#">logs</a>
                        <a class="btn btn-small btn-warning" href="delete/${taskStepRun.id}">delete</a>
                    </#if>
                </td>
            </tr>
                <tr class="content" id='content_${taskStepRun.id}'>
                    <td colspan="7">
                        <span><pre id='span_${taskStepRun.id}'>loading..</pre></span>
                    </td>
                </tr>
            </#list>
        </table>
    </div>

    </@com.page>
</#escape>