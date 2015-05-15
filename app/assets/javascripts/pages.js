window.draw_chart = function () {
    $('#container').highcharts({
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: 'Залежність випадків патології ШКТ від віку'
        },
        xAxis: [{
            categories: ['1-12', '13-24', '25-36', '37-46'],
            crosshair: true
        }],
        yAxis: [{ // Primary yAxis
            labels: {
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            },
            title: {
                text: 'Кількість дітей',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        }],
        tooltip: {
            shared: true
        },
        series: [{
            name: 'Кількість випадків патоголії ШКТ',
            type: 'column',
            data: [31, 22, 9, 4],
            tooltip: {
            }

        }, {
            name: 'Кількість передбачених випадків патоголії ШКТ',
            type: 'spline',
            data: [37, 25, 13, 2],
            tooltip: {
            }
        }]
    });
};