class Renderer
  def render(text_object)
    text = text_object.text
    sice = text_object.size_inches
    color = text_object.color

    # render the text
  end
end

class TextObject
  attr_reader :text, :size_inches, :color

  def initialize(text, size_inches, color)
    @text = text
    @size_inches = size_inches
    @color = color
end

class BritishTextObject
  attr_reader :string, :size_mm, :colour
end

###########################
# 1st way: create adapter #
###########################

class BritishTextObjectAdapter < TextObject
  def initialize(bto)
    @bto = bto
  end

  def text
    @bto.string
  end

  def size_inches
    @bto.size_mm / 25.4
  end

  def color
    @bto.color
  end
end

##################################
# 2nd way: modify original class #
##################################

# Make sure the class is loaded

require 'british_text_object'

# Now add some methods to the original class

class BritishTextOBject
  def color
    colour
  end

  def text
    string
  end

  #etc...
end

#################################
# or define singleton methods #
#################################

bto = BritishTextObject.new('hello', 50,8, :blue)

# def bto.color
#   colour
# end

class << bto
  def color
    colour
  end

  def text
    string
  end

  def size_inches
    size_mm/25.4
  end
end



