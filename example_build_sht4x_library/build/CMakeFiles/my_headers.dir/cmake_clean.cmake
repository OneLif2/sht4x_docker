file(REMOVE_RECURSE
  "libmy_headers.a"
  "libmy_headers.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/my_headers.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
