require_relative('model/bounty.rb')

bounty1 = Bounty.new(
  {'name' => 'Tom', 'bounty_value' =>'20', 'danger_level' => 'high', 'cashed_in' => 'true'}
)
bounty2 = Bounty.new(
  {'name' => 'Jerry', 'bounty_value' =>'300', 'danger_level' => 'low', 'cashed_in' => 'false'}
)

bounty1.save()
bounty2.save()

bounty2.cashed_in = 'true'
bounty2.update()

bounty1.delete()
