require 'spec_helper'
describe 'puppet_galera_innoptimizer' do

  context 'with defaults for all parameters' do
    it { should contain_class('puppet_galera_innoptimizer') }
  end
end
