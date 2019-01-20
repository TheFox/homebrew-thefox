
# File type: production
# Version: v1.0.0-rc.5
# Version Short: 1.0.0-rc.5

class Parameters < Formula
  desc "Automatic replace variables in configuration file templates from environment variables."
  homepage "https://github.com/TheFox/parameters"
  url "https://github.com/TheFox/parameters/archive/v1.0.0-rc.5.tar.gz"
  sha256 "4de47411570e25cc5c29f9d68f628c24aefeeafcc586e51658633bb5f3eaed97"

  depends_on "cmake" => :build

  def install
    sha256_short = "4de47411570e25cc5c29f9d68f628c24aefeeafcc586e51658633bb5f3eaed97"[0..7]
    args = %W[
      -DCMAKE_BUILD_TYPE=release
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -DPROJECT_VERSION_FULL=1.0.0-rc.5
      -DPROJECT_VERSION_HASH=fake-#{sha256_short}
    ]

    system "mkdir build"
    Dir.chdir("build") do
      system "cmake", "..", *args
      system "make"
      bin.install "bin/parameters"
    end
  end

  test do
    system "which", "-a", "parameters"
  end
end
