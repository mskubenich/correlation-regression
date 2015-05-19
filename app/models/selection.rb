class Selection
  def initialize(data_set, cohort_size)
    @data_set = data_set
    @cohort_size = cohort_size.to_i

    parse
  end

  def cohort_size
    @cohort_size
  end

  def cohorts
    @options[:cohorts]
  end

  def frequencies
    @options[:frequencies]
  end

  def group_numbers
    @options[:group_numbers]
  end

  def x_data
    group_numbers
  end

  def y_data
    frequencies
  end

  def x_squares
    @x_squares ||= x_data.map{|item| (item - x_mean)**2 }
  end

  def y_squares
    @y_squares ||= y_data.map{|item| (item - y_mean)**2 }
  end

  def x_squares_sum
    @x_squares_sum ||= x_squares.sum
  end

  def y_squares_sum
    @y_squares_sum ||= y_squares.sum
  end

  def x_total
    group_numbers.sum
  end

  def y_total
    frequencies.sum
  end

  def x_mean
    x_total / group_numbers.size.to_f
  end

  def y_mean
    y_total / frequencies.size.to_f
  end

  def x_dispersion
    @x_dispersion ||= x_squares_sum / x_squares.count.to_f
  end

  def y_dispersion
    @y_dispersion ||= y_squares_sum / y_squares.count.to_f
  end

  def x_deviation
    @x_deviation ||= Math.sqrt(x_dispersion)
  end

  def y_deviation
    @y_deviation ||= Math.sqrt(y_dispersion)
  end

  def xy_sum
    return @xy_sum if @xy_sum
    s = []
    x_data.each_with_index{|x, i| s << x*y_data[i] }
    @xy_sum = s.sum
  end

  def correlation
    @r ||= (( xy_sum  - x_data.count *  x_mean  *  y_mean ) / (x_data.count * x_deviation * y_deviation))
  end

  def regression
    @reggression ||= {
        b:(correlation * ( y_deviation  /  x_deviation )),
        a: y_mean - (correlation * (  y_deviation  /  x_deviation ) * x_mean )
    }
  end

  def regression_chart
    {
        cohorts: cohorts,
        cases: frequencies,
        groups: group_numbers,
        prognoz: group_numbers.map{|g| regression[:b]*(g+1) + regression[:a]}
    }
  end

  def extended_regression_chart
    x = -1 * (regression[:a] / regression[:b].to_f)
    begin
      x = x.floor
      extended_group_numbers = []
      extended_cohorts = []
      extended_frequencies = []

      0.upto x do |i|
        extended_cohorts << "#{ i * @cohort_size + 1 } - #{ i*@cohort_size + @cohort_size }"
        extended_frequencies << (frequencies[i] ? frequencies[i] : 0)
      end

      {
          cohorts: extended_cohorts,
          frequencies: extended_frequencies,
          group_numbers: extended_group_numbers,
          forecast_data: extended_forecast_data,
          y_error_max: y_error_max,
          y_error_min: y_error_min,
          x_error_max: x_error_max,
          x_error_mix: x_error_min
      }
    rescue

    end
  end

  def extended_forecast_data
    x = -1 * (regression[:a] / regression[:b].to_f)
    x = x.floor
    result = []
    0.upto x do |i|
      result << regression[:b]*(i+1) + regression[:a]
    end
    result
  end

  def se2
    y_dispersion/(group_numbers.count - 2)
  end

  def se
    Math.sqrt se2
  end

  def sa
    se * Math.sqrt(1/group_numbers.count + ((x_mean**2) / x_squares_sum ))
  end

  def sb
    se * Math.sqrt(1/ x_squares_sum)
  end

  def sy_y(x)
    se * Math.sqrt(1/group_numbers.count + (((x - x_mean)**2) / x_squares_sum))
  end

  def y_error_max
    result = []
    extended_forecast_data.each_with_index{|v, i| result << (v + sy_y(i))}
    result
  end

  def y_error_min
    result = []
    extended_forecast_data.each_with_index{|v, i| result << (v - sy_y(i))}
    result
  end

  def x_error_max
    result = []
    extended_forecast_data.each_with_index{|v, i| result << (v + sy_x(i))}
    result
  end

  def x_error_min
    result = []
    extended_forecast_data.each_with_index{|v, i| result << (v - sy_x(i))}
    result
  end

  def sy_x(x)
    se * Math.sqrt(1 + 1/group_numbers.count + (((x - x_mean)**2) / x_squares_sum))
  end

  def parse
    return @options if @options
    i = 0
    j = 0
    options = {cohorts: [], frequencies: [], group_numbers: []}
    while i < @data_set.max
      j += 1
      options[:group_numbers] << j
      options[:cohorts] << "#{ i + 1 } - #{ i + @cohort_size }"
      options[:frequencies] << @data_set.select{|item| item >= (i + 1) && item <= i+@cohort_size.to_i }.count
      i += @cohort_size
    end
    @options = options
  end

  def student()
    return @c if @c
    difference = 1000
    @c = 0
    [
        {count: 1, value: 6.3138 },
        {count: 2, value: 2.9200 },
        {count: 3, value: 2.3534 },
        {count: 4, value: 2.1318 },
        {count: 5, value: 2.0150 },
        {count: 6, value: 1.9432 },
        {count: 7, value: 1.8946 },
        {count: 8, value: 1.8595 },
        {count: 9, value: 1.8331 },
        {count: 10, value: 1.8125 },
        {count: 11, value: 1.7959 },
        {count: 12, value: 1.7823 },
        {count: 13, value: 1.7709 },
        {count: 14, value: 1.7613 },
        {count: 15, value: 1.7531 },
        {count: 16, value: 1.7459 },
        {count: 17, value: 1.7396 },
        {count: 18, value: 1.7341 },
        {count: 19, value: 1.7291 },
        {count: 20, value: 1.7247 },
        {count: 21, value: 1.7207 },
        {count: 22, value: 1.7171 },
        {count: 23, value: 1.7139 },
        {count: 24, value: 1.7109 },
        {count: 25, value: 1.7081 },
        {count: 26, value: 1.7056 },
        {count: 27, value: 1.7033 },
        {count: 28, value: 1.7011 },
        {count: 29, value: 1.6991 },
        {count: 30, value: 1.6973 },
        {count: 31, value: 1.6955 },
        {count: 32, value: 1.6939 },
        {count: 33, value: 1.6924 },
        {count: 34, value: 1.6909 },
        {count: 35, value: 1.6896 },
        {count: 36, value: 1.6883 },
        {count: 37, value: 1.6871 },
        {count: 38, value: 1.6860 },
        {count: 39, value: 1.6849 },
        {count: 40, value: 1.6839 },
        {count: 41, value: 1.6829 },
        {count: 42, value: 1.6820 },
        {count: 43, value: 1.6811 },
        {count: 44, value: 1.6802 },
        {count: 45, value: 1.6794 },
        {count: 46, value: 1.6787 },
        {count: 47, value: 1.6779 },
        {count: 48, value: 1.6772 },
        {count: 49, value: 1.6766 },
        {count: 50, value: 1.6759 },
        {count: 100, value: 1.6602 },
        {count: 1000, value: 1.6464 }
    ].each do |i| 
      if (i[:count] - (x_data.count - 2)).abs < difference
        difference = (i[:count] - (x_data.count - 2)).abs
        @c = i[:value]
      end
    end

    @c
  end
end