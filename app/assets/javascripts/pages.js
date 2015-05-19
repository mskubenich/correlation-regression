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
            data: options.frequencies,
            tooltip: {
            }

        }, {
            name: 'Кількість передбачених випадків патоголії ШКТ',
            type: 'spline',
            data: options.forecast_data,
            tooltip: {
            }
        }]
    });
};

window.draw_chart2 = function (container_selector, options) {
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
        plotOptions: {
            spline: {
                marker: {
                    enabled: false
                }
            }
        },
        series: [{
            name: 'Кількість випадків патоголії ШКТ',
            type: 'column',
            data: options.frequencies,
            tooltip: {
            }

        }, {
            name: 'Кількість передбачених випадків патоголії ШКТ',
            type: 'spline',
            data: options.forecast_data,
            tooltip: {
            }
        }, {
            name: 'Верхня границя відхилень значень',
            type: 'spline',
            data: options.y_error_max,
            color: '#0066FF'
        }, {
            name: 'Нижня границя відхилень значень',
            type: 'spline',
            data: options.y_error_min,
            color: '#0066FF'
        }, {
            name: 'Верхня границя відхилень функції',
            type: 'spline',
            data: options.x_error_max,
            color: '#FF0000'
        }, {
            name: 'Нижня границя відхилень функції',
            type: 'spline',
            data: options.x_error_mix,
            color: '#FF0000'
        }]
    });
};

window.draw_gistogramm = function (container_selector, options) {
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

        }]
    });
};

window.draw3d_gistogramm = function (container_selector, options) {
    console.log(options);
    $(container_selector).highcharts({
        chart: {
            margin: 75,
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 25,
                depth: 70
            }
        },
        title: {
            text: 'Залежність випадків патології ШКТ від віку'
        },

        plotOptions: {
            column: {
                depth: 25
            }
        },
        xAxis: [{
            categories: options.cohorts
        }],
        yAxis: [{
            title: {
                text: null
            }
        }],
        series: [{
            name: 'Кількість випадків патоголії ШКТ',
            data: options.cases
        }]
    });
};