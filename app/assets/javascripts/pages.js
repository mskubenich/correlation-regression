window.draw_chart = function (container_selector, options) {
    $(container_selector).highcharts({
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: 'Залежність випадків патології ШКТ від віку'
        },
        xAxis: [{
            categories: options.cohorts,
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
            data: options.cases,
            tooltip: {
            }

        }, {
            name: 'Кількість передбачених випадків патоголії ШКТ',
            type: 'spline',
            data: options.prognoz,
            tooltip: {
            }
        }]
    });
};