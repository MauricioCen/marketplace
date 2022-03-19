# frozen_string_literal: true

RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    export
    show
    new do
      except %w[User Address]
    end
    bulk_delete do
      except %w[User Address]
    end
    edit do
      except %w[User Address]
    end
    delete do
      except %w[User Address]
    end
    show_in_app do
      only %w[]
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
