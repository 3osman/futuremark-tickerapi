var selected;
$(function(){
   
    $('#data-tab').DataTable({
        "scrollY": "500px",
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
            
            $('#data-tab').dataTable().fnClearTable();

            for (var key in data) {
                $('#data-tab').dataTable().fnAddData([key, data[key].number_of_entries, data[key].current_average]);

            }
            

            $('#data-tab-wrapper').show();

            $('#country-name').html(getCountryName(selected));

        }
    });
    
}


var buildMap = function(){
     $.ajax({
        type:'GET',
        url: "/data_manager/country_values",
        dataType: "json",
        
        success: function(data) {
            new jvm.Map({
                container: $('#world-map'),
                regionsSelectable: true,
                regionsSelectableOne: true,
                series: {
                  regions: [{
                    values: data["freq"],
                    scale: ['#C8E6C9', '#1B5E20'],
                    normalizeFunction: 'polynomial'
                  }]
                },
                
                
                onRegionClick : function(e, code){
                    selected = code;
                    updateCountryStats(code);

                },
                
                regionStyle: {
                  selected: { 
                    "fill-opacity": 0.6
                  }
                }

                
            });

            $("#stats").html( data["count"] + " loops, "+Object.keys(data["freq"]).length+" Countries");
        }
    });
}



var updateMap = function(){
     $.ajax({
        type:'GET',
        url: "/data_manager/country_values",
        dataType: "json",
        
        success: function(data) {

            var mapObject = $('#world-map').vectorMap('get', 'mapObject');

            mapObject.series.regions[0].setValues(data["freq"]);
            if(selected){
                updateCountryStats(selected);
            }
            $("#stats").html( data["count"] + " loops, "+Object.keys(data["freq"]).length+" Countries");

           
        }
    });
}
setInterval(updateMap, 5000);
