module ApplicationHelper
  # >> puts Benchmark.measure { Time.now.year }
  # 0.000000   0.000000   0.000000 (  0.000026)
  # It's .02ms, I'd rather never to wory about this, or overengineer it.
  def knowmad_copyright_footer_text
    "&copy; Knowmad #{Time.now.year}"
  end
end
