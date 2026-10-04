// ── Raw API types (snake_case, matching backend schema) ──────────────

type Votes = {
  yes: number;
  no: number;
  abstain: number;
  absent: number;
};

type ClubVotes = Votes & {
  club: string;
  position: 'for' | 'against' | 'abstained' | 'split' | 'absent';
};

type BillOut = {
  print_number: string;
  title: string;
  summary: string | null;
  result: 'passed' | 'rejected' | 'pending';
  votes: Votes | null;
  turnout: number | null;
  clubs: ClubVotes[] | null;
  source_url: string;
};

type SittingDetailResponse = {
  number: number;
  title: string;
  start_date: string;
  end_date: string;
  status: 'planned' | 'in_progress' | 'finished';
  description: string | null;
  votings_count: number;
  turnout: number | null;
  source_url: string;
  bills: BillOut[];
};

// ── Shaped types (camelCase, used by components) ─────────────────────

export type ShapedVotes = {
  yes: number;
  no: number;
  abstain: number;
  absent: number;
};

export type ShapedClubVotes = ShapedVotes & {
  club: string;
  position: 'for' | 'against' | 'abstained' | 'split' | 'absent';
};

export type ShapedBill = {
  printNumber: string;
  title: string;
  summary: string | null;
  result: 'passed' | 'rejected' | 'pending';
  votes: ShapedVotes | null;
  turnout: number | null;
  clubs: ShapedClubVotes[] | null;
  sourceUrl: string;
};

export type ShapedSittingDetail = {
  number: number;
  title: string;
  startDate: string;
  endDate: string;
  status: 'planned' | 'in_progress' | 'finished';
  description: string | null;
  votingsCount: number;
  turnout: number | null;
  sourceUrl: string;
  bills: ShapedBill[];
};

// ── Shapers ──────────────────────────────────────────────────────────

const shapeClubVotes = (club: ClubVotes): ShapedClubVotes => ({
  yes: club.yes,
  no: club.no,
  abstain: club.abstain,
  absent: club.absent,
  club: club.club,
  position: club.position,
});

const shapeBill = (bill: BillOut): ShapedBill => ({
  printNumber: bill.print_number,
  title: bill.title,
  summary: bill.summary,
  result: bill.result,
  votes: bill.votes,
  turnout: bill.turnout,
  clubs: bill.clubs?.map(shapeClubVotes) ?? null,
  sourceUrl: bill.source_url,
});

const shapeSittingDetail = (
  sitting: SittingDetailResponse,
): ShapedSittingDetail => ({
  number: sitting.number,
  title: sitting.title,
  startDate: sitting.start_date,
  endDate: sitting.end_date,
  status: sitting.status,
  description: sitting.description,
  votingsCount: sitting.votings_count,
  turnout: sitting.turnout,
  sourceUrl: sitting.source_url,
  bills: sitting.bills.map(shapeBill),
});

// ── Fetch ────────────────────────────────────────────────────────────

export async function fetchSitting(
  number: number,
): Promise<ShapedSittingDetail> {
  const url = `http://localhost:8000/api/v1/sittings/${number}`;

  const res = await fetch(url, {
    headers: {
      accept: '*/*',
    },
  });

  if (!res.ok) {
    throw new Error(`Error fetching sitting ${number}`);
  }

  const data: SittingDetailResponse = await res.json();

  return shapeSittingDetail(data);
}
