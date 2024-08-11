defmodule AgentRef.Factory do
  use ExMachina.Ecto, repo: AgentRef.Repo


  def agent_factory do
    %AgentRef.Agents.Agent{
      state: Faker.Address.En.state_abbr(),
      address: Faker.Address.En.street_address(),
      first_name: Faker.Person.first_name(),
      last_name: Faker.Person.last_name(),
      license: sequence(:license, &(&1 + 1000000)),
      email: sequence(:email, &"john.doe#{&1}@example.com"),
      city: Faker.Address.En.city(),
      county: "County Coming Soon",
      brokerage: Faker.Company.En.name(),
      broker_phone: Faker.Phone.EnUs.phone(),
      agent_phone: Faker.Phone.EnUs.phone(),
      broker_email: sequence(:broker_email, &"broker#{&1}@bestrealty.com"),
      submitted_by: "user_" <> Integer.to_string(:rand.uniform(1000)),
      longitude: Faker.Address.longitude(),
      latitude: Faker.Address.latitude()
    }
  end

end
