module CreateTeamsTable

import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
  create_table(:teams) do
    [
      pk()
      # cols with constraints
      column(:year, :integer, limit = 4)
      column(:team_name, :string, limit = 40)
      columns([
        :type => :string
        :coach => :string
        :location => :string
        :description => :string
      ])
    ]
  end

  add_index(:teams, :team_name)
  # add_indices(:teams, :column_name_1, :column_name_2)
end

function down()
  drop_table(:teams)
end

end
