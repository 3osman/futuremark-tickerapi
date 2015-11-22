
var v = { "RU": 10 , "FI": 5};
var inc = {"RU": 1 , "FI": 0};
$(function(){
    $('#world-map').vectorMap({
        series: {
            regions: [{
                values: inc,
                scale: ['#FFFFFF', '#00C853'],
                normalizeFunction: 'polynomial'
            }]
        },
        onRegionTipShow: function(e, el, code){
            if(v[code]){
                el.html(el.html()+' (#Tests : '+v[code] +')');
            }

        },
        onRegionClick : function(e, code){
            updateCountryStats(code);

        }
    });
    $('#data-tab').DataTable({
        "scrollY": "480px",
        "scrollCollapse": true,
        "bPaginate": false,
        "bInfo" : false,
        "aoColumnDefs": [
          { "bSearchable": false, "aTargets": [ 1 ] }
        ]
    });
});
function updateCountryStats(selected) {
    $.ajax({
        type:'GET',
        url: "/data_manager/update_table?country="+selected,
        dataType: "json",
        
        success: function(data) {
            console.log(data);
            var tableData = "";
            $('#data-tab').dataTable().fnClearTable();

            for (var key in data) {
                $('#data-tab').dataTable().fnAddData([key,data[key].current_average]);

            }
            

            $('#data-tab-wrapper').show();
            $('#country-name').html(selected);
        }
    });
    
}