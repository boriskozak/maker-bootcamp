-- AutoFlow Pro — Supabase Schema
-- Run this in your Supabase SQL Editor (supabase.com → your project → SQL Editor)

-- ============================================
-- TABLES
-- ============================================

CREATE TABLE vehicles (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  vin TEXT,
  year TEXT NOT NULL,
  make TEXT NOT NULL,
  model TEXT NOT NULL,
  trim TEXT,
  status TEXT DEFAULT 'intake',
  source TEXT,
  purchase_date DATE,
  purchase_price NUMERIC DEFAULT 0,
  estimated_retail_value NUMERIC DEFAULT 0,
  decision TEXT,
  transport_status TEXT DEFAULT 'pending',
  transport_destination TEXT,
  transport_notes TEXT,
  sale_price NUMERIC DEFAULT 0,
  sale_date DATE,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE parts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  vehicle_id UUID REFERENCES vehicles(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  condition TEXT,
  price NUMERIC DEFAULT 0,
  status TEXT DEFAULT 'available',
  sold_price NUMERIC DEFAULT 0,
  sold_date DATE,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE refurb_costs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  vehicle_id UUID REFERENCES vehicles(id) ON DELETE CASCADE,
  description TEXT NOT NULL,
  amount NUMERIC DEFAULT 0,
  date DATE,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- ROW LEVEL SECURITY (permissive for now)
-- ============================================

ALTER TABLE vehicles ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow all on vehicles" ON vehicles FOR ALL USING (true) WITH CHECK (true);

ALTER TABLE parts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow all on parts" ON parts FOR ALL USING (true) WITH CHECK (true);

ALTER TABLE refurb_costs ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow all on refurb_costs" ON refurb_costs FOR ALL USING (true) WITH CHECK (true);

-- ============================================
-- INDEXES for performance
-- ============================================

CREATE INDEX idx_parts_vehicle_id ON parts(vehicle_id);
CREATE INDEX idx_refurb_costs_vehicle_id ON refurb_costs(vehicle_id);
CREATE INDEX idx_vehicles_status ON vehicles(status);
