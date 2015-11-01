Import-Module .\Join-String.psm1 -Force

Function Test-001_Should_return_empty_string_if_given_empty_string {
    $test = Join-String -String ""
    $test -eq ""
}

Function Test-002_Should_return_string_if_given_a_singleton {
    $test = Join-String -String $env:computername
    $test -eq $env:computername
}

Function Test-003_Should_return_a_concatenation_of_both_strings_separated_with_a_space {
    $Test = Join-String -String "foo","bar"
    $test -eq "foo bar"
}

Function Test-004_Shoud_return_a_singleton {
    $Test = Join-String -String "foo","bar"
    $test.count -eq 1
}

Function Test-005_Should_return_a_concatenation_of_both_strings_separated_with_separator {
    $test = Join-String -String "foo","bar" -Separator "_"
    $test -eq "foo_bar"
}

Function Test-006_Should_return_a_concatenation_of_all_strings_with_separator {
    $test = Join-String -String "foo","bar","sucks" -separator "@"
    $test -eq "foo@bar@sucks"
}

Function Test-007_Should_handle_duplicates_of_first_elem {
    $test = Join-String -String "foo","bar","foo" -separator "@"
    $test -eq "foo@bar@foo"   
}

Function Test-008_Should_handle_empty_string_elements {
    $test = Join-String -String "","" -Separator "@"
    $test -eq "@"
}

Function Test-009_Should_take_string_array_from_pipeline {
    $test =  "foo","bar","is","the","best" | Join-String
    $test -eq "foo bar is the best"
}

Function Test-010_Should_not_have_to_explicit_argument_separator {
    $test = "foo","bar","is","outdated" | Join-String "_"
    $test -eq "foo_bar_is_outdated"
}

Function Test-011_Should_return_separator_as_singleton_if_passed_as_argument_for_string {
    $test = Join-String -String " " -Separator " "
    $Test -eq " "
}

Function Test-012_Should_Always_return_string {
    $Test = 1..10 | Join-String 0
    $Test -eq "10203040506070809010"
}

Function Test-013_Should_remove_empty_strings_if_passed_correct_param {
    $Test = "","tio","kldmsfjgp",$null,"","EOS" | Join-String '_' -RemoveEmptyElement
    $Test -eq "tio_kldmsfjgp_EOS"
}