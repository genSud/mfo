;(function($){

    var reportForm = $('#fetch-report-form'),
        ordersForm = $('#fetch-orders-form');

    reportForm.on('submit', function(){
        $('.indicator').removeClass('hidden');
    });

    reportForm.on('ajax:success', function(e, data, status, xhr){
        $('.indicator').addClass('hidden');

        //console.log(data.data);

        if(data.status == "error"){
            $('.indicator').removeClass('hidden').addClass('message').text(data.message);
        }else if(!data.data){
            $('.indicator').removeClass('hidden').addClass('message').text("Нет договоров за этот период");
        }else{
            $('.indicator').addClass('hidden').removeClass('message').text("");



            var table = $('#reports-list'),
                html = "",
                summa = 0,
                j = 0;

            for (var i= 0,ln=data.data.length;i<ln;i++){
                var order = data.data[i],
                    status = order["СтатусСделки"].toLowerCase();
                if(status != 'выдан' && status != 'закрыт') continue;

                var d = new Date(order["Дата"]),
                    dv = new Date(order["ДатаВыдачи"]);

                html += "<tr>" +
                            "<td>" + (j+1) + "</td>" +
                            "<td>" + window.mfo.formatDate(d) + "</td>" +
                            "<td>" + window.mfo.formatDate(dv) + "</td>" +
                            "<td>" + order["ЗаемщикНаименование"] + "</td>" +
                            "<td>" + order["СуммаЗайма"] + "</td>" +
                            "<td>" + order["СуммаВознагражденияАгента"] + "</td>" +
                            "<td class='status'>" + status + "</td>" +
                        "</tr>";

                summa += parseFloat(order["СуммаВознагражденияАгента"], 10);
                j++;
            }

            html += "<tr><td colspan='7'></tr><tr class='selected'><td colspan='5'>Итого:</td><td>"+summa+"</td><td></td></tr>";

            $('tbody', table).html(html);
            table.addClass('in');

            $('#order-status').val("")

        }

    });



    ordersForm.on('ajax:success', function(e, data, status, xhr){
        $('.indicator').addClass('hidden');

        if(data.status == "error"){
            $('.indicator').removeClass('hidden').addClass('message').text(data.message);
        }else if(!data.data){
            $('.indicator').removeClass('hidden').addClass('message').text("Нет отправленных заявок");
        }else{
            $('.indicator').addClass('hidden').removeClass('message').text("");

            $('input,select', $(this)).removeClass('hidden');


            var table = $('#orders-list'),
                html = "";

            for (var i= 0,ln=data.data.length;i<ln;i++){
                var order = data.data[i],
                    d = new Date(order["Дата"]),
                    dv = new Date(order["ДатаВыдачи"]);
                html += "<tr>" +
                    "<td>" + (i+1) + "</td>" +
                    "<td>" + window.mfo.formatDate(d) + "</td>" +
                    "<td>" + window.mfo.formatDate(dv) + "</td>" +
                    "<td>" + order["ЗаемщикНаименование"] + "</td>" +
                    "<td>" + order["СуммаЗайма"] + "</td>" +
                    "<td>" + order["СуммаВознагражденияАгента"] + "</td>" +
                    "<td class='status'>" + order["СтатусСделки"] + "</td>" +
                    "</tr>";
            }

            $('tbody', table).html(html);
            table.addClass('in');

            $('#order-status').val("")

        }

    });


    $('#order-status').on('change', function(){
        var status = $(this).val();

        $('#orders-list tbody tr').each(function(i){
            var tr = $(this),
                tr_status = $('.status', tr).text().toLowerCase().trim();
            if(status && status !== tr_status){
                tr.hide(200);
            }else{
                tr.show(200);
            }

        });
    });


    ordersForm.submit();



})(jQuery);