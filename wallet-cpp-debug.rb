
class WalletCppDebug < Formula
  desc "A spreadsheet likewise C++17 program to track your finances."
  homepage "https://github.com/TheFox/wallet-cpp"
  url "https://github.com/TheFox/wallet-cpp/archive/v0.7.5.tar.gz"
  sha256 "78ff8c5a85e2513199dac4ad3d125c4f7321d207908fefdc50fe01b6ebda4efb"

  depends_on "cmake" => :build
  depends_on "boost" => "1.62"
  depends_on "yaml-cpp" => "0.6"
  depends_on "mstch" => "1.0"
  depends_on "gnuplot" => "5.0"

  conflicts_with "wallet-cpp", :because => "wallet-cpp also ships a wallet binary. wallet-cpp-debug is for debugging only."

  def install
    system "mkdir build"
    Dir.chdir("build") do
      system "cmake",
        "-DCMAKE_INSTALL_PREFIX=#{prefix}",
        "-DPROJECT_SHARE_PREFIX=#{share}",
        "-DCMAKE_BUILD_TYPE=debug",
        "-DWALLETCPP_GNUPLOT_SUPPORT=ON",
        ".."
      system "make"
      bin.install "bin/wallet"
    end

    share.install Dir["resources"]
  end

  test do
    system "which", "-a", "wallet"
  end
end