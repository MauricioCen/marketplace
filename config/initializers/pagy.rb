# frozen_string_literal: true

require 'pagy/extras/metadata'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:items]    = 5
Pagy::DEFAULT[:metadata] = %i[items count page pages]
Pagy::DEFAULT[:overflow] = :empty_page
