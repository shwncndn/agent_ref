defmodule AgentRef.Questions do
  @moduledoc """

  This module contains all of the questions and answer sets in the FAQ section.

  """

  @doc """

  """
  def general_faqs do
    Enum.with_index([
      {"Why do these devices cost so much less than prescription hearing aids?",
       "At SoundLift Hearing Aids, our dedicated mission is to make the latest hearing technology accessible to Americans at the most affordable prices. By selling directly to you, we cut out the middlemen, ensuring that you receive high-quality hearing aids without the inflated costs associated with traditional hearing clinics.  Comparably featured hearing aids at these clinics can often be priced over $8,000. SoundLift Hearing Aids offers you a transparent and honest pricing model, delivering superior hearing solutions without compromising quality. Experience the benefits of improved hearing without the financial burden, as we continue to redefine affordability and accessibility in the hearing aid market."},
      {"Do I need to get tested first?",
       "No. our hearing aids are designed for people with mild to moderate hearing loss and over the age of 18. You can try our hearing aids straight out of the box. We offer volume control and various programs to allow you to tailor the devices according to your needs."},
      {"Does it take time to get accustomed to wearing hearing aids?",
       "If you are a first-time wearer, it can take some time to get used to the hearing aids. How quickly you will adjust often depends on how frequently you wear them. We recommend that you start with wearing the devices 4-6 hours a day around your house during the first week and scale up from there to a point where you feel that having them in feels natural. Work your way up until the hearing aids feel natural."},
      {"How do I clean my hearing aids?",
       "Wearing a hearing aid can increase the amount of earwax your ear produces. It is important to clean your hearing aids regularly. Use a alcohol wipe, soft cloth, or tissue to wipe the surface of the device. Use the brush to clean away any traces of wax from around the sound outlet and wax guard. If the microphone opening is clogged by dust or dirt, carefully brush away visible signs of debris from the openings."},
      {"How do I insert and remove the device?",
       "To insert the hearing aid, hold it with the pull wire between your thumb and forefinger.
        Gently pull downwards on your earlobe with your free hand to make it easier to insert.
        To remove the device, gently pull on the pull wire to remove the device.
        Turn the volume down the first time you try the hearing aid.
        It is normal for the device to give temporary feedback or whistle when you insert it or take it out."}
    ])
  end

  def map_faqs do
    Enum.with_index([
      {"What is the expected battery life per charge for the over-the-counter hearing aids themselves?",
       "Based on usage, 14-20 hours is typical. Higher output demands shorter life."},
      {"How long will a fully charged charging case power the hearing aids before needing to be recharged?",
       "The number of full hearing aid charges from a case varies widely, but five day's worth is common."},
      {"Can I use any power adapter to charge the over-the-counter hearing aid charging case?",
       "No, use only the power adapter included to avoid damage."},
      {"What maintenance is required for over-the-counter hearing aids and charging case during long periods of non-use?",
       "Fully charge devices before storing for a prolonged time. Periodically check battery levels and recharge as needed."},
      {"Can the rechargeable battery in over-the-counter hearing aids leak over time?",
       "It's unlikely with modern lithium-ion batteries, but possible. Avoid storing in extreme heat or cold."}
    ])
  end
end
