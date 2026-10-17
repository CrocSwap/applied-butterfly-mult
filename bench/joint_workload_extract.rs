// Resource-only driver for Yuya Uezato's pinned MIT-licensed xorslp_ec.
use xorslp_ec::*;
use xorslp_ec::reorder::Pebble;

fn name(p: &Pebble) -> String { format!("{}", p) }
fn emit(k: usize, m: usize, op: &str, full: &slp::SLP) {
    let s = for_benchmark::shrink(full);
    let graph = for_benchmark::xor_repair(&s);
    let (_, raw) = for_benchmark::graph_analyze(&s, &graph);
    let (_, fused) = for_benchmark::bench_fusion(&s, &graph);
    let (_, _, _, _, scheduled) = for_benchmark::bench_pebble(&s, &graph);
    for (label, program) in [("compressed", raw), ("fused", fused), ("scheduled", scheduled)] {
        let stats = stat::analyze(&program);
        print!("{{\"k\":{},\"m\":{},\"op\":\"{}\",\"variant\":\"{}\",\"inputs\":{},\"outputs\":{},\"xors\":{},\"memory_accesses\":{},\"variable_slots\":{},\"matrix\":[", k,m,op,label,s.num_of_constants,s.height(),stats.nr_xors,stats.nr_memacc,stats.nr_variables);
        for i in 0..s.height() {
            if i>0 { print!(","); }
            let v: Vec<usize> = s[i].iter().enumerate().filter_map(|(j,x)| if *x {Some(j)} else {None}).collect();
            print!("{:?}",v);
        }
        print!("],\"program\":[");
        for (i,(t,vs)) in program.iter().enumerate() {
            if i>0 { print!(","); }
            print!("[\"{}\",[", name(t));
            for (j,v) in vs.iter().enumerate() { if j>0 {print!(",");} print!("\"{}\"", name(v)); }
            print!("]]");
        }
        println!("]}}");
    }
}
fn main() {
    for (k,m) in [(4,2),(8,2),(10,4)] {
        let enc = vandermonde::rsv(k,m);
        emit(k,m,"encode",&slp::SLP::build_from_bitmatrix_not_depending_variables(&rsv_bitmatrix::matrix_to_bitmatrix(&enc)));
        let mut dec = enc.clone();
        let missing = if m==2 {vec![2,3]} else {vec![2,4,5,6]};
        dec.drop_rows(missing);
        let inv = dec.inverse().unwrap();
        emit(k,m,"decode",&slp::SLP::build_from_bitmatrix_not_depending_variables(&rsv_bitmatrix::matrix_to_bitmatrix(&inv)));
    }
}
