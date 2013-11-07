require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class GrAirModes < Formula
  homepage 'https://github.com/bistromath/gr-air-modes'
  head 'https://github.com/bistromath/gr-air-modes.git'
  #version ''
  #sha1 ''

  depends_on 'cmake' => :build
  depends_on 'numpy' => :python
  depends_on 'scipy' => :python
  depends_on 'gnuradio'
  depends_on 'gr-osmosdr'
  depends_on 'sqlite'
  depends_on 'python'
  

  def install
    #ENV.j1  # if your formula's build system can't parallelize
    mkdir 'build' do
      system 'cmake', '..', *std_cmake_args << "-DPYTHON_LIBRARY=#{python_path}/Frameworks/Python.framework/"
      system 'make'
      system 'make install'
      # May not be necessary
      # system "sudo ldconfig"
    end
  end                    
  
  def python_path
    python = Formula.factory('python')
    kegs = python.rack.children.reject { |p| p.basename.to_s == '.DS_Store' }
    kegs.find { |p| Keg.new(p).linked? } || kegs.last
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test gr-air-modes`.
    system "false"
  end
end
