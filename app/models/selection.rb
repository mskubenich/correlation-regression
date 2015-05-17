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

  private

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
end