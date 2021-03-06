require 'spec_helper'

describe Ruroku::Release do
  before do
    @release = Ruroku::Release.new stubbed_app, name: 'v2'
    @api = @release.api
  end

  describe '#rollback' do
    it 'rollbacks to given release' do
      @api.should_receive(:post_release).with @release.app.name, @release.name
      @release.rollback
    end
  end
end
