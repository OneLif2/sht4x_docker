file(REMOVE_RECURSE
  "libmy_headers.pdb"
  "libmy_headers.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/my_headers.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
