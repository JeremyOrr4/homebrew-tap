class Caged < Formula
  desc "Run coding agents in isolated containers"
  homepage "https://github.com/JeremyOrr4/caged"
  url "https://github.com/JeremyOrr4/caged/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "f32a91a71465ef0cc8dc2168f7f3903c36e4d978a9b863c7b594626e3974d3e0"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/caged"
  end

  test do
    assert_match "caged version #{version}", shell_output("#{bin}/caged --version")
  end
end
