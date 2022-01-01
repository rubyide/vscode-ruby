require('open-uri')
require('fileutils')
require 'json'

=begin
  foo
  bar
  baz
=end

#
# foo
# bar
# baz
#

module Foo
  class Bam
    def foo
      puts "bar"
    end

    def baz
      puts "foo"
    end
  end
  class Ben
  end
  module Bamm
  end
  class Folds < Bar
    CONSTANT1 = {
      foo: 1,
      bar: 2,
      baz: 3
    }

    CONSTANT2 = [
      :foo,
      :bar,
      :baz
    ]

    def self.klassmethod
      puts "foo"
      puts "bar"
      puts "baz"
    end

    def method1(a)
      case a
      when 1
        puts "foo"
      when 2
        puts "bar"
      when 3
        puts "baz"
      end

      case
      when a == 1
        puts "foo"
      when a == 2
        puts "bar"
      when a == 3
        puts "baz"
      end
    end

    def method2
      text = <<TEXT
      Lorem ipsum dolar sit amet,
      foo bar baz bat
TEXT
      text2 = <<-TEXT
      Lorem ipsum dolar sit amet,
      TEXT

      text3 = <<~TEXT
      Lorem ipsum dolar sit amet,
      TEXT
    end

    def method3(a)
      if (a)
        puts "foo"
        bar
        baz
        bat
      else
        puts "bar"
      end

      unless (a)
        puts "not foo"
      end

      if (b) then
        puts "bazinga"
      end

      unless (b) then
        puts "not bazinga"
      end
    end

    # Cras at pellentesque risus, dictum elementum mauris
    #
    # Maecenas id sem rhoncus lectus consequat accumsan non sed
    # dolor. Fusce imperdiet egestas arcu, vel scelerisque nisl lobortis ut. Proin sit amet tincidunt augue, id facilisis
    # augue. Praesent dignissim, purus vel viverra lacinia, ante lacus finibus nisl, in condimentum ligula felis sed elit.
    # Nulla non arcu vitae nunc pharetra varius venenatis vel sapien. Phasellus ex quam, commodo fringilla vehicula nec,
    # gravida ut ex. Nullam pharetra posuere justo, ut aliquam ante pharetra at. Nulla enim sapien, rhoncus suscipit quam
    # eget, bibendum posuere risus. Aliquam aliquam commodo neque, eu euismod ligula laoreet ut.
    #
    def method4(a)
      if a
        puts "bam"
      end
      unless(a)
        puts "baz"
      end
    end

    def method5
      method3(true)
      method4(false)
      begin
        raise 'KERBLAM'
      rescue
        puts 'kerblam was raised'
      end
    end

    def method6
      (1..5).to_a.each do |i|
        puts i
      end
    end
  end
end
