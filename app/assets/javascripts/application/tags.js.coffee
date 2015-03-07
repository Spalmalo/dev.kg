jQuery ->
  $('input.tags').tokenfield
    autocomplete:
      source: '/tags/autocomplete'
      delay: 100