# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SolidusImporter::ProcessRow do
  subject(:described_instance) { described_class.new(importer, row) }

  let(:importer) {}
  let(:row) {}

  it { expect { described_instance }.to raise_error(SolidusImporter::Exception, 'No importer defined') }

  context 'with an importer' do
    let(:importer) { instance_double('AnImporter') }

    it { expect { described_instance }.to raise_error(SolidusImporter::Exception, 'Invalid row type') }

    context 'with a row' do
      let(:row) { SolidusImporter::Row.new }

      it { expect(described_instance).to be_instance_of(described_class) }
    end
  end
end
