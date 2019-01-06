<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <link href="https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css" />
    </head>
    <script>
        var model = null;
        $(document).ready(function () {
            $.ajax("/allscore", {
                success: function (data) {
                    console.log(data);
                    model = new Vue({
                        el: "#app",
                        data: {
                            students: data
                        }
                    });
                }
            });
        });
    </script>
    <body>
        <form method="POST" action="score">
            <input type="text"  name="id"/><input type="submit">
        </form>
        <table id="app" border="1">
            <thead>
                <tr>
                    <td>id</td>
                    <td>name</td>
                    <td>score</td>
                    <td>edit</td>
                    <td>delete</td>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(student,index) in students">
                    <td>{{index}}</td>
                    <td>{{student.name}}</td>
                    <td>{{student.score}}</td>
                    <td><button v-on:click="editLogin(login);">Edit</button></td>
                    <td><button v-on:click="deleteLogin(index);">Delete</button></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
