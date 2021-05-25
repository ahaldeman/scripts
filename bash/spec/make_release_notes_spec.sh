Describe 'make_release_notes.sh'
    Include './make_release_notes.sh'

    It 'prints an error if PIVOTAL_TRACKER_API_TOKEN env var is missing'
        When call make_release_notes
        The output should equal 'Missing PIVOTAL_TRACKER_API_TOKEN'
    End
End
