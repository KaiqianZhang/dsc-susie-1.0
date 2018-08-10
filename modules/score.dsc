# score modules
compute_hit: compute_hit.R + R(hit_res=compute_hit(cs, beta_idx))
  cs: $cs
  beta_idx: $beta_idx
  $hit: hit_res
  
  
  