require_relative '../../spec_helper'

describe Kontena::RpcClient do

  let(:ws_client) { double(:ws_client) }
  let(:subject) { described_class.new(ws_client) }

  describe '#request_id' do
    it 'returns random integer' do
      id = subject.request_id
      expect(id).to be_instance_of(Fixnum)
    end

    it 'retries to generate id if id is already used' do
      subject.requests[1] = double(:request)
      i = 0
      expect(subject.wrapped_object).to receive(:rand).twice do
        i += 1
      end
      subject.request_id
    end
  end
end