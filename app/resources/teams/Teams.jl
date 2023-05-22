module Teams

import SearchLight: AbstractModel, DbId
import Base: @kwdef

export Team

@kwdef mutable struct Team <: AbstractModel
  id::DbId = DbId()
  type::String = "Futbol"
  team_name::String = ""
  coach::String = ""
  year::Int = 0
  location::String = ""
  description::String = ""
end

end