Import-Module C:\Users\Administrateur\Documents\WindowsPowerShell\TD02.psm1 -Force

Function Test-Should_return_empty_string_if_given_empty_string {
    $test = Join-String -String ""
    $test -eq ""
}

Function Test-Should_return_string_if_given_a_singleton {
    $test = Join-String -String $env:computername
    $test -eq $env:computername
}

Function Test-Should_return_a_concatenation_of_both_strings_separated_with_a_space {
    $Test = Join-String -String "foo","bar"
    $test -eq "foo bar"
}

Function Test-Shoud_return_a_singleton {
    $Test = Join-String -String "foo","bar"
    $test.count -eq 1
}

Function Test-Should_return_a_concatenation_of_both_strings_separated_with_separator {
    $test = Join-String -String "foo","bar" -Separator "_"
    $test -eq "foo_bar"
}

Function Test-Should_return_a_concatenation_of_all_strings_with_separator {
    $test = Join-String -String "foo","bar","sucks" -separator "@"
    $test -eq "foo@bar@sucks"
}

Function Test-Should_handle_duplicates_of_first_elem {
    $test = Join-String -String "foo","bar","foo" -separator "@"
    $test -eq "foo@bar@foo"   
}

Function Test-Should_take_string_array_from_pipeline {
    $test =  "foo","bar","is","the","best" | Join-String
    $test -eq "foo bar is the best"
}

Function Test-Should_not_have_to_explicit_argument_separator {
    $test = "foo","bar","is","outdated" | Join-String "_"
    $test -eq "foo_bar_is_outdated"
}

Function Test-Should_return_separator_as_singleton_if_passed_as_argument_for_string {
    $test = Join-String -String " " -Separator " "
    $Test -eq " "
}

Function Test-Should_Always_return_string {
    $Test = 1..10 | Join-String 0
    $Test -eq "10203040506070809010"
}