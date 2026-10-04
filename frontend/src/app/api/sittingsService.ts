export type Sitting = {
  number: number;
  title: string;
  description: string;
  start_date: string;
  end_date: string;
  status: string;
  votings_count: number;
};

type SittingsResponse = {
  items: Sitting[];
  page: number;
  page_size: number;
  total: number;
  pages: number;
};

export type ShapedSitting = {
  number: number;
  title: string;
  description: string;
  startDate: string;
  endDate: string;
  status: string;
  votingsCount: number;
};

export type ShapedSittingsResponse = {
  items: ShapedSitting[];
  page: number;
  pageSize: number;
  total: number;
  pages: number;
};

const shapeSitting = (sitting: Sitting): ShapedSitting => ({
  number: sitting.number,
  title: sitting.title,
  description: sitting.description,
  startDate: sitting.start_date,
  endDate: sitting.end_date,
  status: sitting.status,
  votingsCount: sitting.votings_count,
});

export async function fetchSittings(): Promise<ShapedSittingsResponse> {
  const url = 'http://localhost:8000/api/v1/sittings?page=1&page_size=3';
  
  const res = await fetch(url, {
    headers: {
      'accept': '*/*'
    },
  });

  if (!res.ok) {
    throw new Error('Error fetching sittings');
  }

  const data: SittingsResponse = await res.json();

  return {
    items: data.items.map(shapeSitting),
    page: data.page,
    pageSize: data.page_size,
    total: data.total,
    pages: data.pages,
  };
}