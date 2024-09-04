<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/layout/menu.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
</style>
</head>
<body>
<div id="app">
	<div id="chart" @click="fnGetChart">
      <apexchart type="line" width="90%" height="350" :options="chartOptions" :series="series"></apexchart>
    </div>
</div>
</body>
</html>

<script>
var app = new Vue({
	el : '#app',
	components: {
      apexchart: VueApexCharts,
    },
	data : {
		series: [{
            name: "test",
            data: []
        }],
        chartOptions: {
          chart: {
            height: 350,
            type: 'line',
            zoom: {
              enabled: false
            }
          },
          dataLabels: {
            enabled: false
          },
          stroke: {
            curve: 'straight',
            colors : '#ff0000'
          },
          title: {
            text: 'test',
            align: 'center'
          },
          grid: {
            row: {
              colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
              opacity: 0.5
            },
          },
          xaxis: {
            categories : []
          }
        }
	},// data
	methods : {
        fnGetChart(){
            var self = this;
			var nparmap = {

			};
			$.ajax({
				url:"chart.dox",
				dataType:"json",
				type : "POST", 
				data : nparmap,
				success : function(data) { 
					console.log(data);
					// price ('series' 데이터 변경)
					var priceList = [];
					for(var i=0; i<data.chart.length; i++){
						priceList.push(data.chart[i].price);
					}

					// pdate
					var dataList = [];
					for(var m=0; m<data.chart.length; m++){
						dataList.push(data.chart[m].pdate);
					}

					self.fnChart(priceList, dataList);
					
				}
			});
        },
        fnChart(priceList, dataList){
			var self = this;
			self.series=  [{
	            name: "test",
	            data: priceList
	        }]
	        self.chartOptions = {
	          chart: {
	            height: 350,
	            type: 'area',
	            zoom: {
	              enabled: false
	            }
	          },
	          dataLabels: {
	            enabled: false
	          },
	          stroke: {
	            curve: 'straight'
	          },
	          title: {
	            text: 'test',
	            align: 'center'
	          },
	          grid: {
	            row: {
	              colors: ['#f3f3f3', 'transparent'], 
	              opacity: 0.5
	            },
	          },
	          xaxis: {
	            categories: dataList,
	          }
	        }
        }
		
	}, // methods
	created : function() {
		var self = this;
        self.fnGetChart();
	}// created
});
</script>