Pod::Spec.new do |s|
  s.name     = 'ADBReasonableTextView'
  s.version  = '1.0.1'
  s.platform = :ios, '5.0'
  s.summary  = 'A UITextView replacement with reasonable delegate methods.'
  s.homepage = 'https://github.com/albertodebortoli/ADBReasonableTextView'
  s.author   = { 'Alberto De Bortoli' => 'albertodebortoli.website@gmail.com' }
  s.source   = { :git => 'https://github.com/albertodebortoli/ADBReasonableTextView.git', :tag => s.version.to_s }
  s.license      = { :type => 'New BSD License', :file => 'LICENSE' }
  s.source_files = 'ADBReasonableTextView/Source/*.{h,m}'
  s.requires_arc = true
end
