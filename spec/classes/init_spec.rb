require 'spec_helper'
describe 'galera_innoptimizer' do

  context 'with defaults for all parameters' do
    it { should contain_class('galera_innoptimizer') }
  end
end
