shared_examples 'approved, retry, or declined' do
  let(:_approved) { described_class.new(respstat: 'A') }
  let(:_retry)    { described_class.new(respstat: 'B') }
  let(:_declined) { described_class.new(respstat: 'C') }
  let(:_cc_declined) { described_class.new(respstat: 'C', respproc: 'PPS') }
  let(:_cp_declined) { described_class.new(respstat: 'C', respproc: 'FNOR') }

  context '.approved?' do
    it "returns true when respstat == 'A'" do
      expect(_approved).to be_approved
    end

    it "returns false when respstat != 'A'" do
      expect(_retry).to_not be_approved
      expect(_declined).to_not be_approved
    end
  end

  context '.retry?' do
    it "returns true when respstat == 'B'" do
      expect(_retry).to be_retry
    end

    it "returns false when respstat != 'B'" do
      expect(_approved).to_not be_retry
      expect(_declined).to_not be_retry
    end
  end

  context '.declined?' do
    it "returns true when respstat == 'C'" do
      expect(_declined).to be_declined
    end

    it "returns false when respstat != 'C'" do
      expect(_approved).to_not be_declined
      expect(_retry).to_not be_declined
    end

    it "returns true when respproc == 'PPS'" do
      expect(_cc_declined).to be_card_connect_declined
    end

    it "returns false when respproc != 'PPS'" do
      expect(_cp_declined).to_not be_card_connect_declined
    end

    it "returns true when respproc != 'PPS'" do
      expect(_cp_declined).to be_card_processor_declined
    end

    it "returns false when respproc == 'PPS'" do
      expect(_cc_declined).to_not be_card_processor_declined
    end
  end
end
